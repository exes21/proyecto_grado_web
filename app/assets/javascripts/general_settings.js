$(document).ready(function(){
  var home_map = new GMaps({
    el: '#map',
    lat:  19.4743005,
    lng: -70.6653768,
  });

  var points = []
  var map = new GMaps({
    el: '#map',
    lat:  19.4743005,
    lng: -70.6653768,
    click: function(e) {
      points.push([e.latLng.lat(),e.latLng.lng()]);
      console.log(points);
      drawMap()
    },
  });

  function drawMap(){
    map.drawPolygon({
      paths: points,
      strokeColor: '#BBD8E9'
    });
  }

  function clear_map(){
    points = []
  }
});
