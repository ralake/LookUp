$( document ).ready(function(){
  function getPosition(position) {
    $.post('/roofs/new',{ latitude: position.coords.latitude, longitude: position.coords.longitude });
  }
  $("#btn-start").click(function() { navigator.geolocation.getCurrentPosition(getPosition);
  });
});