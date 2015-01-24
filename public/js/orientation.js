function orientation() {
    var alpha;
    var compass = document.getElementById('compass');
    if(window.DeviceOrientationEvent) {

      window.addEventListener('deviceorientation', function(event) {
        // var alpha;
        //Check for iOS property
        if(event.webkitCompassHeading) {
          alpha = Math.round(event.webkitCompassHeading);
          //Rotation is reversed for iOS
          compass.style.WebkitTransform = 'rotate(-' + alpha + 'deg)';
        }
        //non iOS
        else {
          alpha = Math.round(event.alpha);
          webkitAlpha = alpha;
          if(!window.chrome) {
            //Assume Android stock (this is crude, but good enough for our example) and apply offset
            webkitAlpha = alpha-270;
          }
        }

        compass.style.Transform = 'rotate(' + alpha + 'deg)';
        compass.style.WebkitTransform = 'rotate('+ webkitAlpha + 'deg)';
        //Rotation is reversed for FF
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