$( document ).ready(function(){
  greyOut('#PhotoInfo');

  navigator.geolocation.getCurrentPosition(getPosition);

  var lat;
  var longit;

  function getPosition(position) {
    lat = position.coords.latitude;
    longit = position.coords.longitude;
  }

  $('#submit_button').click(function() {
    $.post('/geolocation',{ latitude: lat, longitude: longit });
  });

});