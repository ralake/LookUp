/*
	javascript ruler for google maps V3

	by Giulio Pons. http://www.barattalo.it
	this function uses the label class from Marc Ridley Blog

*/

var ruler1;
var ruler2;

var ruler1label;
var ruler2label;

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


function addruler() {

	ruler1 = new google.maps.Marker({
		position: map.getCenter() ,
		map: map,
		draggable: true
	});

	markers.push(ruler1);

	ruler2 = new google.maps.Marker({
		position: map.getCenter() ,
		map: map,
		draggable: true
	});

	markers.push(ruler2);

	if (ruler1 === undefined) {

	}
	ruler1label = new Label({ map: map });
	ruler2label = new Label({ map: map });
	ruler1label.bindTo('position', ruler1, 'position');
	ruler2label.bindTo('position', ruler2, 'position');
	markers.push(ruler1label, ruler2label);

	var rulerpoly = new google.maps.Polyline({
		path: [ruler1.position, ruler2.position] ,
		strokeColor: "#FFFF00",
		strokeOpacity: 0.7,
		strokeWeight: 7
	});

	markers.push(rulerpoly);

	rulerpoly.setMap(map);

	ruler1label.set('text',distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
	ruler2label.set('text',distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));

	google.maps.event.addListener(ruler1, 'drag', function() {
		rulerpoly.setPath([ruler1.getPosition(), ruler2.getPosition()]);
		ruler1label.set('text',distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
		ruler2label.set('text',distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
		console.log(distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
		console.log(distance( ruler2.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
	});

	google.maps.event.addListener(ruler2, 'drag', function() {
		rulerpoly.setPath([ruler1.getPosition(), ruler2.getPosition()]);
		ruler1label.set('text',distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
		ruler2label.set('text',distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
		console.log(distance( ruler1.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));
		console.log(distance( ruler2.getPosition().lat(), ruler1.getPosition().lng(), ruler2.getPosition().lat(), ruler2.getPosition().lng()));

	});

}

function clearRuller() {
	ruler1label.set('');
	ruler2label.set('');
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
	else if (d<=1) return Math.round(d*1000)+"m";
	return d;
}