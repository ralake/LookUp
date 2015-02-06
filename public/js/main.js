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

  // POST orientation and geolocation
  $('#toPageFour').click(function() {
    $.post('/roofs/new', { orientation: 2 })
      .then(function(data) {
        response = $.parseJSON(data);
        roofId = response.id;
        return roofId;
      })
      .then(function(roofId) {
        console.log(roofId)
      $.post('/roofs/' + roofId + '/geolocation/edit', { latitude: lat, longitude: long })
    })
  });

  // POST roof-type
  $('#flatRoof').click(function() {
    $.post('/roofs/' + roofId + '/type/edit', { angle: 0 });
  });

});