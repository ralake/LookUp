$(document).ready(function(){

  orientation();
  greyOut('#screen');
  gyroscope();
  var roofId;
  var lat;
  var long;
  var angle;

  function getPosition(position) {
    lat = position.coords.latitude;
    long = position.coords.longitude;
  }

  navigator.geolocation.getCurrentPosition(getPosition);

  // POST orientation and geolocation
  $('#toPageFour').click(function() {
    orient = document.getElementById('compass').innerHTML;
    $.post('/roofs/new', { orientation: orient })
      .then(function(data) {
        response = $.parseJSON(data);
        roofId = response.id;
        return roofId;
      })
      .then(function(roofId) {
      $.post('/roofs/' + roofId + '/geolocation/edit', { latitude: lat, longitude: long });
    });
  });


  // POST roof-type
  $('#flatRoof').click(function() {
    $.post('/roofs/' + roofId + '/angle/edit', { angle: 0 });
  });

  // POST roof-angle
  $('#toPageSix').click(function() {
    angle = document.getElementById('dataContainerOrientation').innerHTML.slice(0, 2);
    $.post('/roofs/' + roofId + '/angle/edit', { angle: angle });
  });


});