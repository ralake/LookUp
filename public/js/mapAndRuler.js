var map;
var markers = [];

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

function start() {
  var id = $('#map-canvas').data("roof-id");
  $.getJSON("/roofs/" + id).then(function(data) {
    var myLatlng = new google.maps.LatLng(data.latitude, data.longitude);
    var myOptions = {
      zoom: 25,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.SATELLITE
    };
    map = new google.maps.Map(document.getElementById('map-canvas'), myOptions);
    var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
    });
    markers.push(marker);
  });
}

google.maps.event.addDomListener(window, 'load', start);

/*
	javascript ruler for google maps V3

	by Giulio Pons. http://www.barattalo.it
	this function uses the label class from Marc Ridley Blog

*/

function addruler() {

  deleteMarkers();

  ruler1 = new google.maps.Marker({
    position: map.getCenter(),
    map: map,
    draggable: true
  });

  ruler2 = new google.maps.Marker({
    position: map.getCenter(),
    map: map,
    draggable: true

  });

  var ruler1label = new Label({ map: map });
  var ruler2label = new Label({ map: map });
  ruler1label.bindTo('position', ruler1, 'position');
  ruler2label.bindTo('position', ruler2, 'position');

  var rulerpoly = new google.maps.Polyline({
    path: [ruler1.position, ruler2.position],
    strokeColor: "#FFFF00",
    strokeOpacity: 0.7,
    strokeWeight: 7
  });

  markers.push(ruler1, ruler2, ruler1label, ruler2label, rulerpoly);

  rulerpoly.setMap(map);

  ruler1label.set('text',distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
  ruler2label.set('text',distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));

  google.maps.event.addListener(ruler1, 'drag', function() {
    rulerpoly.setPath([ruler1.getPosition(), ruler2.getPosition()]);
    ruler1label.set('text',distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
    ruler2label.set('text',distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
  });

  google.maps.event.addListener(ruler2, 'drag', function() {
    rulerpoly.setPath([ruler1.getPosition(), ruler2.getPosition()]);
    ruler1label.set('text',distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
    ruler2label.set('text',distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
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