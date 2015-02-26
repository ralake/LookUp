$(document).ready(function(){

  initCamera();
  orientation();
  new Gyroscope().setAngle();
  var roof;
  var roofId;
  var lat;
  var long;
  var angle;
  var material;
  var shader_interval;

  function geoSuccess(position) {
    lat = position.coords.latitude;
    long = position.coords.longitude;
    $('#geoSuccess').attr("data-latitude", lat);
    $('#geoSuccess').attr("data-longitude", long);
  }

  // Add selected class to 
  // clicked material icons
  $('.material_icon').click(function() {
    $('.material_icon').removeClass('selected');
    $(this).addClass('selected');
    material = this.innerHTML;
  });

  $('#shader').change(function() {
    if ($('#shader').val() === '0') {
      $('#shade').text('No Shade');
    }
    else if ($('#shader').val() === '1') {
      $('#shade').text('Half Shade');
    }
    else {
      $('#shade').text('Full Shade');
    }
  });

  $('body').on("touchend", "#shader", function() {
    clearInterval(shader_interval);
  });
  
  $('body').on("click", ".help-open", function(e) {
    e.stopPropagation();
    e.preventDefault();
    
    var el = $(this).parent().find(".help")
    el.show()
      .addClass("bounceInDown")
      .one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
        el.removeClass("bounceInDown");
      });
  });
  
  $('body').on("click", ".help-close", function(e) {
    e.stopPropagation();
    e.preventDefault();
    
    var el = $(this).closest(".help")
    
    el.addClass("bounceOutUp")
      .one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
        el.removeClass("bounceOutUp");
        el.hide();
      });
  });

  // POST create roof
  $('#btn-start').click(function() {
    $.post('/roofs/new').then(function(data) {
      roofId = $.parseJSON(data).id
      $('#roofId').attr("value", roofId);
      navigator.geolocation.getCurrentPosition(geoSuccess);
    });
  });

  // POST geolocation
  $('#geoSuccess').watch('data-latitude', function() {
    $.post('/roofs/' + roofId + '/geolocation', { latitude: lat, longitude: long })
  })

  // POST orientation
  $('#toPageFive').click(function() {
    var orientation = document.getElementById('compass').innerHTML
    $.post('/roofs/' + roofId + '/orientation', {orientation: orientation});
  });

  // POST roof-type
  $('#flatRoof').click(function() {
    $.post('/roofs/' + roofId + '/angle', { angle: 0 });
  });

  // POST roof-angle
  $('#topage_photo').click(function() {
    angle = document.getElementById('setRoofAngle').innerHTML.slice(0, -1);
    $.post('/roofs/' + roofId + '/angle', { angle: angle });
  });

  // POST material
  $('#topage_shade').click(function() {
    $.post('/roofs/' + roofId + '/material', { material: material });
  });

  // POST shading
  $('#topage_measurement').click(function() {
    var shade = document.getElementById('shade').innerHTML;
    $.post('/roofs/' + roofId + '/shading', { shade: shade });
  });

  // POST measurements
  function RoofEdges() {
    this.angled = $('#angled').val().slice(0, -1);
    this.gutter = $('#gutter').val().slice(0, -1);
  }

  RoofEdges.prototype.postEdges = function() {
    var _this = this;
    $.post('/roofs/' + roofId + '/measurements', { angled_edge: this.angled, gutter_edge: this.gutter })
      .then(function(data) {
        roof = $.parseJSON(data);
        _this.setResults(roof);
      });
  };

  $('#btn-measurements').click(function() {
    new RoofEdges().postEdges();
  });

  RoofEdges.prototype.setResults = function(roof) {
    document.getElementById('panelCapacity').innerHTML = roof.panel_capacity;
    document.getElementById('powerCapacity').innerHTML = roof.power_capacity;
    document.getElementById('homesToPower').innerHTML = roof.homes_to_power;
    document.getElementById('roofMaterial').innerHTML = roof.material;
    document.getElementById('roofShade').innerHTML = roof.shade;
    document.getElementById('roofAngle').innerHTML = roof.angle;
  };

  // POST results
  $('#user_data').submit(function(event) {
    var response;
    var title = $(this).find("input[name='title']").val();
    var discoveredBy = $(this).find("input[name='discovered_by']").val();
    var userEmail = $(this).find("input[name='user_email']").val();
    event.preventDefault();
    $.post('/roofs/' + roofId + '/capacity', { title: title, discovered_by: discoveredBy, user_email: userEmail })
      .then(function(data) {
        response = $.parseJSON(data);
        if (response.errors) {
          $('#flashError').text(response.errors[0]);
        } else {
          $('#flashError').text('');
          window.location.href = 'http://www.1010global.org/uk';
        }
      });
    });

  function responseHandler (response) {
    response = $.parseJSON(data);
    if (response.errors) {
      $('#flashError').text(response.errors[0]);
    } else {
      window.location.href = 'http://www.1010global.org/uk';
    }
  }
  
  var hammertime = new Hammer($('.slide-panels').eq(0)[0]);
  
  hammertime.on("swipeleft", function(){
    $('.slide-panels').animate({
      left: "-=" + $(window).width() + "px"
    }, 500);
  });
  
  hammertime.on("swiperight", function(){
    $('.slide-panels').animate({
      left: "+=" + $(window).width() + "px"
    }, 500);
  });

});