$( document ).ready(function(){
  ;

  navigator.geolocation.getCurrentPosition(getPosition);

  var lat;
  var longit;
  var id = $('.page-wrap').data("roof-id");

  function getPosition(position) {
    lat = position.coords.latitude;
    longit = position.coords.longitude;
  }

  $('#submit_button').click(function() {
    $.post('/roofs/' + id + '/geolocation',{ latitude: lat, longitude: longit });
  });

});