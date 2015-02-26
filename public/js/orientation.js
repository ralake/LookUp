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
  if($.inArray(azimuth, _.range(0, 22)) !== -1 || $.inArray(azimuth, _.range(338, 361)) !== -1) {
    $('#page_orientation').removeClass('green').addClass('red');
    return 'north.' + '<br>' + 'Try from the other side';
  } 
  else if ($.inArray(azimuth, _.range(22, 68)) !== -1) {
    $('#page_orientation').removeClass('green').addClass('red');
    return 'north east.' + '<br>' + 'Try from the other side';
  } 
  else if ($.inArray(azimuth, _.range(68, 113)) !== -1) {
    $('#page_orientation').removeClass('red').addClass('green'); 
    return 'east';
  }
  else if ($.inArray(azimuth, _.range(113, 158)) !== -1) {
    $('#page_orientation').removeClass('red').addClass('green'); 
    return 'south east';
  }
  else if ($.inArray(azimuth, _.range(158, 202)) !== -1) {
    $('#page_orientation').removeClass('red').addClass('green'); 
    return 'south';
  }
  else if ($.inArray(azimuth, _.range(203, 248)) !== -1) {
    $('#page_orientation').removeClass('red').addClass('green'); 
    return 'south west';
  }
  else if ($.inArray(azimuth, _.range(248, 293)) !== -1) {
    $('#page_orientation').removeClass('red').addClass('green'); 
    return 'west';
  }
  else if($,inArray(azimuth, _.range(293, 337)) !== -1) {
    $('#page_orientation').removeClass('green').addClass('red');
    return 'north west.' + '<br>' + 'Try from the other side';
  }
  // if($.inArray(azimuth,  _.range(0, 90)) !== -1) { return 'north.' + '<br>' + 'Try from the other side';} 
  // else if ($.inArray(azimuth,  _.range(270, 361)) !== -1) { 
  //   $('#page_orientation').removeClass('green').addClass('red');
  //   return 'north.' + '<br>' + 'Try from the other side';
  // } 
  // else if ($.inArray(azimuth,  _.range(90, 180)) !== -1) {
  //   $('#page_orientation').removeClass('red').addClass('green');
  //   return 'south east';
  // } 
  // else {
  //   $('#page_orientation').removeClass('red').addClass('green'); 
  //   return 'south west';
  // }
}

