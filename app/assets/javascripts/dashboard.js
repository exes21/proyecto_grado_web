var map = new GMaps({
    el: '#map',
    lat:  19.4743005,
    lng: -70.6653768,
});

$(document).ready(function (){
    $.ajax({
        type: "GET",
        url: "/coordinates.json",
        success: function(data, textStatus, jqXHR){
          console.log(data);
          $.each(data,function(index, value){
            map.addMarker({
                lat: value.latitude,
                lng: value.longitude,
              });
          });
        },
        error: function(jqXHR, textStatus, errorThrown){
          console.log("no guardo");
        }
      })
})