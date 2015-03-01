var fallback = { lat:51.506699, lon: -0.098362};
var map;
var latlng;

// Init map, fired from OK button of #page_shade
function initMap() {
  
  var latitude = $('body').data('lat');
  var longitude = $('body').data('lon');
  
  // If there's a lat and lon, use it, otherwise use fallback
  if (latitude && longitude) {
    latlng = new google.maps.LatLng(latitude, longitude);
  }
  else {
    latlng = new google.maps.LatLng(fallback.lat, fallback.lon);
  }
  
  var options = {
    zoom: 20,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.SATELLITE,
    disableDefaultUI: true
  };
  
  map = new google.maps.Map($('#map')[0], options);
  addRulers(latlng);
}


function resizeMap() {
  google.maps.event.trigger(map, 'resize');
  map.setCenter(myLatlng);
}


function addRulers(latlon) {
  var clicked = {},
  marker,
  handles = [],
  rulers = [],
  points = [
    [270, 0.005],
    [90, 0.005],
    [26.57, 0.0112],
    [333.43, 0.0112],
  ];
  
  marker_options = {
    url: '/images/img_marker.png',
    size: new google.maps.Size(42, 42),
    origin: new google.maps.Point(0,0),
    anchor: new google.maps.Point(21, 21)
  };
  
  function nextRuler(index) {
    if(index == 3) {
      return 0;
    } else {
      return index+1;
    }
  }
  
  for(var i=0; i<4; i++) {
    var handle = new google.maps.Marker({
      position: latlon.destinationPoint(points[i][0], points[i][1]),
      map: map,
      draggable: true,
      icon: marker_options
    });
    
    handles.push(handle);
  }
  
  for(var i=0; i<4; i++) {
    var next_handle = i+1;
    if (next_handle == 4) { next_handle = 0; }
    
    var ruler = {
      polyline: new google.maps.Polyline({
        path: [handles[i].position, handles[next_handle].position],
        strokeColor: "white",
        strokeOpacity: 0.8,
        strokeWeight: 5
      }),
      handle_a_index: i,
      handle_b_index: next_handle
    }
    
    rulers.push(ruler);
    ruler.polyline.setMap(map);
    
    (function (_i, _handle1, _handle2) {
      google.maps.event.addListener(ruler.polyline, 'click', function() {
        rulerClicked(this, _i, _handle1, _handle2);
      });
    })(i, handles[i], handles[next_handle]);
  }
  
  
  function rulerClicked(ruler_polyline, index, handle1, handle2) {
    
    $.each(rulers, function(i, ruler) {
      ruler.polyline.setOptions({strokeColor: "white"});
    });

    ruler_polyline.setOptions({strokeColor: "#EA3F48"});

    if (clicked[0] && clicked[1] && clicked[2]) {
      $('.step').eq(0).removeClass('open');
      $('.step').eq(1).removeClass('open');
      $('.step').eq(2).addClass('open');
    }
    
    var gutter_distance = distance(
      handle1.position.lat(),
      handle1.position.lng(),
      handle2.position.lat(),
      handle2.position.lng()
    );
    
    $('body').attr('data-gutter', gutter_distance);
    
    var angle_distance = distance(
      handles[rulers[nextRuler(index)].handle_a_index].position.lat(),
      handles[rulers[nextRuler(index)].handle_a_index].position.lng(),
      handles[rulers[nextRuler(index)].handle_b_index].position.lat(),
      handles[rulers[nextRuler(index)].handle_b_index].position.lng()
    );
    
    $('body').attr('data-angled', angle_distance);
  }
  
  
  //$("#angled").val(distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
  
  //$("#gutter").val(distance( ruler2.getPosition().lat(), ruler2.getPosition().lng(), ruler3.getPosition().lat(), ruler3.getPosition().lng()));
  
  google.maps.event.addListener(handles[0], 'drag', function() {
    rulers[0].polyline.setPath([handles[0].getPosition(), handles[1].getPosition()]);
    rulers[3].polyline.setPath([handles[3].getPosition(), handles[0].getPosition()]);
    checkProgress(0);
  });

  google.maps.event.addListener(handles[1], 'drag', function() {
    rulers[0].polyline.setPath([handles[0].getPosition(), handles[1].getPosition()]);
    rulers[1].polyline.setPath([handles[1].getPosition(), handles[2].getPosition()]);
     checkProgress(1);
  });
  
  google.maps.event.addListener(handles[2], 'drag', function() {
    rulers[1].polyline.setPath([handles[1].getPosition(), handles[2].getPosition()]);
    rulers[2].polyline.setPath([handles[2].getPosition(), handles[3].getPosition()]);
     checkProgress(2);
  });
  
  google.maps.event.addListener(handles[3], 'drag', function() {
    rulers[2].polyline.setPath([handles[2].getPosition(), handles[3].getPosition()]);
    rulers[3].polyline.setPath([handles[3].getPosition(), handles[0].getPosition()]);
     checkProgress(3);
  });
  
  
  function checkProgress(handle_index) {
    clicked[handle_index] = true;
    if (clicked[0] && clicked[1] && clicked[2]) {
      $('.step').eq(0).removeClass('open');
      $('.step').eq(1).addClass('open');
    }
  }

}

function distance(lat1,lon1,lat2,lon2) {
  var R = 6371; // km (change this constant to get miles)
  var dLat = (lat2-lat1) * Math.PI / 180;
  var dLon = (lon2-lon1) * Math.PI / 180;
  var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.cos(lat1 * Math.PI / 180 ) * Math.cos(lat2 * Math.PI / 180 ) *
    Math.sin(dLon/2) * Math.sin(dLon/2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  var d = R * c;
  return (d*1000).toFixed(2);
}

Number.prototype.toRad = function() {
  return this * Math.PI / 180;
};

Number.prototype.toDeg = function() {
  return this * 180 / Math.PI;
};

google.maps.LatLng.prototype.destinationPoint = function(brng, dist) {
   dist = dist / 6371;  
   brng = brng.toRad();  

   var lat1 = this.lat().toRad(), lon1 = this.lng().toRad();

   var lat2 = Math.asin(Math.sin(lat1) * Math.cos(dist) + 
                        Math.cos(lat1) * Math.sin(dist) * Math.cos(brng));

   var lon2 = lon1 + Math.atan2(Math.sin(brng) * Math.sin(dist) *
                                Math.cos(lat1), 
                                Math.cos(dist) - Math.sin(lat1) *
                                Math.sin(lat2));

   if (isNaN(lat2) || isNaN(lon2)) return null;

   return new google.maps.LatLng(lat2.toDeg(), lon2.toDeg());
};
