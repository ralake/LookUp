function orientation() {
  var alpha;
  var compassBearing;
  var compass = document.getElementById('compass');
  var facing = document.getElementById('facing');
  
  if(window.DeviceOrientationEvent) {
    window.addEventListener('deviceorientation', function(event) {
      if(event.webkitCompassHeading) {
        alpha = Math.round(event.webkitCompassHeading);
        compassBearing = reverseBearing(alpha);
        compass.innerHTML = compassBearing;
        roofFacing.innerHTML = roofFacing(compassBearing);
      }
      else {
        alpha = Math.round(event.alpha);
        compassBearing = reverseBearing(alpha);
        webkitAlpha = alpha;
        if(!window.chrome) {
          webkitAlpha = alpha-270;
        }
      }
        compass.innerHTML = compassBearing;
        facing.innerHTML = roofFacing(compassBearing);
    }, false);
  }
}

function reverseBearing(alpha) {
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

