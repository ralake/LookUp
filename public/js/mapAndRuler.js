var FALLBACK_LAT_LON = [51.506699, -0.098362];
var map;
var markers = [];
var active_dimension = "angled";

$(document).ready(function() {
  
  $("#btn-gutter").css("display", "none");
  $("#2nd_text").css("display", "none");
  
  
  google.maps.event.addDomListener(window, 'load', setup_map);
  
  
  $("#btn-angled").click(function(event) {
    event.preventDefault();
    $("#2nd_text, #btn-gutter").css("display", "block");
    $("#1st_text, #btn-angled").css("display", "none");
    active_dimension = "gutter";
  });
  
});

function setAllMap(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

function clearMarkers() {
  setAllMap(null);
}
function deleteMarkers() {
  clearMarkers();
  markers = [];
}

// setting up google map
function setup_map() {
  
  $('#roofId').watch('value', function() {
    console.log($('#roofId').val())
    $.getJSON("/roofs/" + $('#roofId').val()).then(function(data) {
      // If there's a lat and lon, use it, otherwise use fallback
      if (data.latitude && data.longitude) {
        myLatlng = new google.maps.LatLng(data.latitude, data.longitude);}
      else {
        myLatlng = new google.maps.LatLng(FALLBACK_LAT_LON[0], FALLBACK_LAT_LON[1]);
      }
      
      var myOptions = {
        zoom: 20,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.SATELLITE,
        disableDefaultUI: true
      };
      
      map = new google.maps.Map(document.getElementById('map-canvas'), myOptions);
      addRuler(myLatlng);
    });
  });
}

/*
	javascript ruler for google maps V3

	by Giulio Pons. http://www.barattalo.it
	this function uses the label class from Marc Ridley Blog

*/

function addRuler(latlon) {
  
  var a_marker = {
    url: '/images/img_a_marker.png',
    size: new google.maps.Size(50, 50),
    origin: new google.maps.Point(0,0),
    anchor: new google.maps.Point(50, 25)
  };
  
  var b_marker = {
    url: '/images/img_b_marker.png',
    size: new google.maps.Size(50, 50),
    origin: new google.maps.Point(0,0),
    anchor: new google.maps.Point(0, 25)
  };

  deleteMarkers();

  ruler1 = new google.maps.Marker({
    position: latlon.destinationPoint(270, 0.005),
    map: map,
    draggable: true,
    icon: a_marker
  });

  ruler2 = new google.maps.Marker({
    position: latlon.destinationPoint(90, 0.005),
    map: map,
    draggable: true,
    icon: b_marker
  });

  var rulerpoly = new google.maps.Polyline({
    path: [ruler1.position, ruler2.position],
    strokeColor: "#FFFFFF",
    strokeOpacity: 0.8,
    strokeWeight: 5
  });

  markers.push(ruler1, ruler2, rulerpoly);

  rulerpoly.setMap(map);

  google.maps.event.addListener(ruler1, 'drag', function() {
    rulerpoly.setPath([ruler1.getPosition(), ruler2.getPosition()]);
    length = distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng());
    $("#" + active_dimension).val(distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
  });

  google.maps.event.addListener(ruler2, 'drag', function() {
    rulerpoly.setPath([ruler1.getPosition(), ruler2.getPosition()]);
    length = distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng());
    $("#" + active_dimension).val(distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
  });

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
  if (d>1) return Math.round(d)+"km";
  else if (d<=1) return (d*1000).toFixed(2)+"m";
  return d;
}

Number.prototype.toRad = function() {
   return this * Math.PI / 180;
}

Number.prototype.toDeg = function() {
   return this * 180 / Math.PI;
}

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
}
