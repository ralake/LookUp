$( document ).ready(function(){
  greyOut('#PhotoInfo');

  navigator.geolocation.getCurrentPosition(getPosition, geoError);

  var lat;
  var longit;

  function getPosition(position) {
    lat = position.coords.latitude;
    longit = position.coords.longitude;
  }

  function geoError(position) {
    console.log('Error occurred - no GPS data obtained');
  }

  $('#submit').click(function() {
    $.post('/geolocation',{ latitude: lat, longitude: longit });
  });

});