function orientation() {
  var alpha;
  var compass = document.getElementById('compass');
  var facing = document.getElementById('facing');
  
  if(window.DeviceOrientationEvent) {

    window.addEventListener('deviceorientation', function(event) {
      if(event.webkitCompassHeading) {
        alpha = Math.round(event.webkitCompassHeading);
        compass.innerHTML = roofOrientation(alpha);
        roofFacing.innerHTML = roofFacing(roofOrientation(alpha));
      }
      else {
        alpha = Math.round(event.alpha);
        webkitAlpha = alpha;
        if(!window.chrome) {
          webkitAlpha = alpha-270;
        }
      }
        compass.innerHTML = roofOrientation(alpha);
        facing.innerHTML = roofFacing(roofOrientation(alpha));
    }, false);
  }

  $('#flat').click(function(){
    $('#flat_hidden').attr('value', alpha);
  });


  $('#sloped').click(function(){
    $('#sloped_hidden').attr('value', alpha);
  });
  
  $('.submit_form').click(function() {
    console.log($(this).attr("data-form"));
    var form = $(this).attr("data-form");
    $("#" + form).submit();
  })
}

function roofOrientation(alpha) {
  if (alpha > 180) { return alpha - 180; }
  else { return alpha + 180; }  
}

function roofFacing(azimuth) {
  if (azimuth === 0 || azimuth === 360) {return "north";}
  if (azimuth === 90) {return "east";}
  if (azimuth === 180) {return "south";}
  if (azimuth === 270) {return "west";}
  if($.inArray(azimuth,  _.range(0, 90)) !== -1) { return 'north east';} 
  else if ($.inArray(azimuth,  _.range(270, 361)) !== -1) { return 'north west';} 
  else if ($.inArray(azimuth,  _.range(90, 180)) !== -1) { return 'south east';} 
  else { return 'south west';}
}
