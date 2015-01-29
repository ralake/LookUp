function gyroscope() {

  var angle;

  var dataContainerOrientation = document.getElementById('dataContainerOrientation');
    if(window.DeviceOrientationEvent) {
    window.addEventListener('deviceorientation', function(event) {
      
    angle = Math.abs(Math.round(event.beta));

    if(angle !== null); 
    dataContainerOrientation.innerHTML = angle + '°';
    }, false);

    $('#capture').click(function(){
      $('#capture_hidden').attr('value', angle);
    });
  }
}

