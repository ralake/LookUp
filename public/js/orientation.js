function orientation() {
    var alpha;
    var compass = document.getElementById('compass');
    if(window.DeviceOrientationEvent) {

      window.addEventListener('deviceorientation', function(event) {
        if(event.webkitCompassHeading) {
          alpha = Math.round(event.webkitCompassHeading);
          compass.style.WebkitTransform = 'rotate(-' + alpha + 'deg)';
        }
        else {
          alpha = Math.round(event.alpha);
          webkitAlpha = alpha;
          if(!window.chrome) {
            webkitAlpha = alpha-270;
          }
        }

        compass.style.Transform = 'rotate(' + alpha + 'deg)';
        compass.style.WebkitTransform = 'rotate('+ webkitAlpha + 'deg)';
        compass.style.MozTransform = 'rotate(-' + alpha + 'deg)'; 
      }, false);
    }

    $('#flat').click(function(){
      $('#flat_hidden').attr('value', alpha);
    });


    $('#sloped').click(function(){
      $('#sloped_hidden').attr('value', alpha);
    });
  }