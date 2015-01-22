function init() {

  var angle

  var dataContainerOrientation = document.getElementById('dataContainerOrientation');
    if(window.DeviceOrientationEvent) {
    window.addEventListener('deviceorientation', function(event) {
      
    angle = Math.round(event.beta);

    if(angle!=null) 
    dataContainerOrientation.innerHTML = 'Roof angle: ' + angle + ' degrees';
    }, false);
  }

  $('#capture').click(function(event){
    event.preventDefault();
      $.post('/sloped_roof_angle',{ roof_angle: angle }, function(err){
        // if (err) {
        //   // console.log(err);
        // }
      });
      window.location.href = '/summary'
  });
}

