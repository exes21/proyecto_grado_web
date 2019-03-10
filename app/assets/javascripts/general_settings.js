  var points = []
  var map = new GMaps({
    el: '#map',
    lat:  19.4743005,
    lng: -70.6653768,
    click: function(e) {
      var point = [e.latLng.lat(),e.latLng.lng()];
      points.push(point);
      markMap(e.latLng.lat(),e.latLng.lng(), points.indexOf(point));
    },
  });

  function listMark(lat, lng, id){
    $('#points-list').append('<li class="list-group-item" id="point-'+ id +'"><div class="list-group-item-text pull-left"><p><b>Lat: </b>'+ lat +'</p><p><b>Lng: </b>'+ lng +'</p></div><div class="pull-right"><button class="badge btn-danger remove-point">Eliminar</button></div><div class="clearfix"></div></li>');
    // TODO: Arreglar borrado, que elimina dos o mas
    $('.remove-point').click(function (){
      $(this).closest('.list-group-item').remove();
      map.removeMarkers();
      $('.list-group-item').remove();
      points.splice(id , 1)

      for(let i = 0; i < points.length; i++){
        markMap(points[i][0], points[i][1], i)
      }
    });
  }

  function markMap(lat, lng, id){
    map.addMarker({
      lat: lat,
      lng: lng,
      title: "point: " + id
    });
    listMark(lat, lng, id)
  }

  function paintMap(){
    map.drawPolygon({
      paths: points,
      strokeColor: 'green'
    });
  }

  $('#save-setting-map').click(function (){
    paintMap();
    $.ajax({
      type: "POST",
      url: "/general_settings/save",
      data: {
        points: points
      },
      success: function(data, textStatus, jqXHR){
        console.log("guardo");
      },
      error: function(jqXHR, textStatus, errorThrown){
        console.log("no guardo");
      }
    })
  });

  $('#clear-setting-map').click(function(){
    points = []
    $('.list-group-item').remove();
    map.removeMarkers();
  });
