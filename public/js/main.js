$(document).ready(function(){

  browserDetect();
  greyOut('#screen');
  orientation();
  gyroscope();
  var roofId;
  var lat;
  var long;
  var angle;
  var material;

  navigator.geolocation.getCurrentPosition(getPosition)

  function getPosition(position) {
    console.log(position.coords.latitude)
    lat = position.coords.latitude;
    long = position.coords.longitude;
  }

  // Add selected class to 
  // clicked material icons
  $('.material_icon').click(function() {
    $('.material_icon').removeClass('selected');
    $(this).addClass('selected');
    material = this.innerHTML;
  });

  // Update shade percent on slider change
  $('#shader').change(function() {
    $('#shade').text($(this).val() + "%");
  });
  
  var shader_interval;
  
  $('body').on("touchstart", "#shader", function() {
    var el = $(this);
    shader_interval = setInterval(function() {
      $('#shade').text(el.val() + "%");
    }, 50);
  });

  $('body').on("touchend", "#shader", function() {
    clearInterval(shader_interval);
  });

  // POST orientation and geolocation
  $('#toPageFour').click(function() {
    orient = document.getElementById('compass').innerHTML;
    $.post('/roofs/new', { orientation: orient })
      .then(function(data) {
        response = $.parseJSON(data);
        roofId = response.id;
        return roofId;
      })
      .then(function(roofId) {
        $.post('/roofs/' + roofId + '/geolocation', { latitude: lat, longitude: long })
      .then(function() {
        $('#roofId').attr("value", roofId);
      });
    });
  });

  // POST roof-type
  $('#flatRoof').click(function() {
    $.post('/roofs/' + roofId + '/angle', { angle: 0 });
  });

  // POST roof-angle
  $('#toPageSix').click(function() {
    angle = document.getElementById('dataContainerOrientation').innerHTML.slice(0, 2);
    $.post('/roofs/' + roofId + '/angle', { angle: angle });
  });

  // POST material
  $('#toPageEight').click(function() {
    $.post('/roofs/' + roofId + '/material', { material: material });
  });

  // POST shading
  $('#toPageNine').click(function() {
    var shade_value = document.getElementById('shade').innerHTML;
    $.post('/roofs/' + roofId + '/shading', { shade_value: shade_value });
  });

  // POST measurements
  $('#btn-gutter').click(function() {
    var angled = $('#angled').val().slice(0, -1);
    var gutter = $('#gutter').val().slice(0, -1);
  
    $.post('/roofs/' + roofId + '/measurements', { angled_edge: angled, gutter_edge: gutter });
  });

});