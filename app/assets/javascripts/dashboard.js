var home_map = new GMaps({
    el: '#map',
    lat:  19.4743005,
    lng: -70.6653768,
});

$(document).ready(function (){
  var start = new Date;

  setInterval(function() {
    $.ajax({
      type: "GET",
      url: "/coordinates.json",
      success: function(data, textStatus, jqXHR){
        console.log(data);
        $.each(data,function(index, value){
          home_map.addMarker({
              lat: data.location.latitude,
              lng: data.location.longitude,
              infoWindow: {
                content:  '<p>usuario:'+ data.user.name +'</p>' +
                          '<p>dispositivo:'+ data.mobile.mac_address +'</p>' +
                          '<p>Lng:'+ value.longitude +'</p>' +
                          '<p>Lng:'+ value.longitude +'</p>'
              }
            });
        });
      },
      error: function(jqXHR, textStatus, errorThrown){
        console.log("no guardo");
      }
    })
  }, 1000);
})
