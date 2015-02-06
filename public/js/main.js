$(document).ready(function(){

  orientation();
  greyOut('#screen');
  gyroscope();
  var roofId;
  var lat;
  var long;
  var alpha;

  function getPosition(position) {
    lat = position.coords.latitude,
    long = position.coords.longitude
  }

  navigator.geolocation.getCurrentPosition(getPosition);

  $('#toPageFour').click(function() {
    $.post('/roofs/new', { orientation: alpha , latitude: lat, longitude: long }).then(function(data) {
      response = $.parseJSON(data);
      roofId = response.id;
    })
  });

});