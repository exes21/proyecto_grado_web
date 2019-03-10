var map = new GMaps({
  el: '#zone_map',
  lat:  19.4743005,
  lng: -70.6653768,
  click: function(e) {
    var latitude = $('#access_point_coordinate_attributes_latitude')
    var longitude = $('#access_point_coordinate_attributes_longitude')
    latitude.val(e.latLng.lat());
    longitude.val(e.latLng.lng());
  },
});
