$(document).ready(function(){
  
  orientation();
  
  new Gyroscope().setAngle();
  var roof, roofId, lat, long,
  angle, material, shader_interval;

  function geoSuccess(position) {
    lat = position.coords.latitude;
    long = position.coords.longitude;
    $('#geoSuccess').attr("data-latitude", lat);
    $('#geoSuccess').attr("data-longitude", long);
  }

  $('.material_icon').click(function() {
    $('.material_icon').removeClass('selected');
    $(this).addClass('selected');
    material = this.innerHTML;
  });

  $('#shader').change(function() {
    if ($('#shader').val() === '0') {
      $('#shade').text('Looks clear');
    }
    else if ($('#shader').val() === '1') {
      $('#shade').text('Nothing major');
    }
    else {
      $('#shade').text('Looks shady');
    }
  });
  
  $('.button').click(function() {
    $(this).addClass('clicked');
  })

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
  $('#page_index').click(function() {
    $.post('/roofs/new').then(function(data) {
      roofId = $.parseJSON(data).id
      $('#roofId').attr("value", roofId);
      $('body').data('roof-id', roofId);
      navigator.geolocation.getCurrentPosition(geoSuccess);
    });
  });

  // POST geolocation
  $('#geoSuccess').watch('data-latitude', function() {
    $.post('/roofs/' + roofId + '/geolocation', { latitude: lat, longitude: long })
  })

  // POST orientation
  $('#orientationPost').click(function() {
    var orientation = $('body').data('orientation');
    $.post('/roofs/' + roofId + '/orientation', {orientation: orientation});
  });
  
  $('.roof_type').click(function() {
    $('.roof_type').removeClass('selected');
    $(this).addClass('selected');
    if ($(this).attr("id") == "slopedRoof") {
      divert('page_roof_angle');
    } else {
      divert('page_photo');
    }
  });
  
  // POST roof-type
  $('#roofTypePost').click(function() {
    if($('#flatRoof').hasClass('selected')) {
      $.post('/roofs/' + roofId + '/angle', { angle: 0 });
    }
  });

  // POST roof-angle
  $('#roofAnglePost').click(function() {
    angle = $('body').data('angle');
    $.post('/roofs/' + roofId + '/angle', { angle: angle });
  });

  // POST material
  $('#roofMaterialPost').click(function() {
    var material = $('.material.selected').attr('id');
    $.post('/roofs/' + roofId + '/material', { material: material });
  });
  
  $('.material').click(function() {
    $('.material').removeClass('selected');
    $(this).addClass('selected');
  });

  // POST shading
  $('#shadePost').click(function() {
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
    var discoveredBy = $(this).find("input[name='discovered_by']").val();
    var userEmail = $(this).find("input[name='user_email']").val();
    event.preventDefault();
    $.post('/roofs/' + roofId + '/capacity', { discovered_by: discoveredBy, user_email: userEmail })
    .then(function(data) {
      response = $.parseJSON(data);
      if (response.errors) {
        $('#flashError').text(response.errors[0]);
      } else {
        $('#flashError').text('');
        document.getElementById('user_email').innerHTML = response.user_email;
      }
    });
  });
    
  // Camera logic
  $('#takePictureField').on("touchstart click", function() {
    $('#choosePhoto')
      .html('<i class="icon-sync animated infinite "></i>')
      .addClass('loading');
  });
  
  $('#takePictureField').change(function(e) {
    
    var file = e.target.files[0];
    
    var reader = new FileReader();
  
    reader.onload = function(event) {
      var filename = file.name;
      var data = event.target.result;
    
      $.ajax({url: "/roofs/" + $('body').data('roof-id') + "/photo",
        type: 'POST',
        data: { filename: filename, data: data },
        success: function(data, status, xhr) { console.log("Image posted.") }
      });
    
      $('#choosePhoto').click();
    
    };
    
    reader.readAsDataURL(file);
  });
    
  // Page logic
  var userClick = false;
  var fresh = true;
  var default_page_id = "page_index";
  var num_pages = $('.pages .page').length;

  var box1 = $('.box-1');
  var box2 = $('.box-2');

  FastClick.attach(document.body);

  document.ontouchmove = function(event){
    event.preventDefault();
  }

  if (window.navigator.standalone) {
    $('.arrow').hide();
  }

  pagesInit();
  $(window).resize(pagesInit);

  function pagesInit() {
    $('body').append('<div id="log"></div>');
  
    var height = $(window).height();
    var width = $(window).width();

    $('body').css('height', height + "px");

    $('.box').each(function(i) {  
      $(this).css({ 
        height: height + "px",
        width: width + "px",
        'z-index': "-" + i
      });
    });

    $('.expand').each(function(i) {
      $(this).css({
        height: height + "px",
        width: width + "px"
      });
    });
  
    $('.content').css("height", (height-100) +"px");
  
    $('.next').click(function() {
      $(this).closest(".page-slides").css("left", "-=" + width + "px");
      $('.cloud').css("left", "-=" + (width*0.2) + "px");
      $('.city').css("left", "-=" + (width*0.1) + "px");
    });
  
    var clouds = [
      {x:35, y:70, depth:2},
      {x:300, y:50, depth:1},
      {x:240, y:50, depth:3},
      {x:25, y:190, depth:3},
      {x:290, y:140, depth:3}
    ];

    $.each(clouds,function(i, cloud) {
      $('<div />').addClass('cloud')
        .css({ 
          left: cloud.x,
          top: cloud.y,
          width: (50*(cloud.depth*0.5)) + "px",
          height:  (50*(cloud.depth*0.5)) + "px"
        })
        .data('depth', cloud.depth)
        .appendTo('.page-slides-mask');
    });
  }

  var History = window.History;

  if (History.enabled) {
  
    State = History.getState();
    // set initial state to first page that was loaded
    History.pushState({page_id: idFromPath(window.location.pathname)}, $("title").text(), State.urlPath);
    changePage(State);
  
  } else {
    return false;
  }

  // Bind to StateChange Event
  History.Adapter.bind(window, 'statechange', function() {
    changePage(History.getState());
    userClick = false;
  });

  $('body').on('click', '.nav', function() {
    userNavigates($(this));
  });

  function changePage(state) {
    console.log("Changing page...");
  
    // First page, only fires once
    if (fresh == true) {

      fresh = false;
    
      var page_id = state.data.page_id;
    
      if (page_id === undefined) {
        page_id = default_page_id;
      }
    
      var page = $('#' + page_id);
      var page_next = $('#' + page.attr("data-next"));


      box1.append(page);
      box2.append(page_next);
    
      $('.box .page').css('display', 'block');
    
      return;
    }
  
    if (userClick == false) {
    
      $('.pages')
        .append($('.box .page').hide());
    
      var page = $('#' + state.data.page_id);
      var page_next = $('#' + page.attr("data-next"));

      box1.append(page);
      box2.append(page_next);
    
      $('.box .page').show();
    
      return;
    }
  
    var page = box1.find('.page');
    var page_next = $('#' + page.attr("data-next"));
    var page_after = $('#' + page_next.attr("data-next"));
  
    box2.append(page_next);
  
    $('.box .page').show();
  
    box1.addClass('zoomOutSlideLeft');
    box2.addClass('slideLeftZoomIn');
  
    box2.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
    
      console.log("Finished animating.");
    
      box1
        .append(page_next)
        .removeClass('zoomOutSlideLeft');
      
      box2
        .html(page_after)
        .removeClass('slideLeftZoomIn');
      
      $('.pages').append(page.hide());
    
      $('.box .page').show();
    
    });
  
  }

  function userNavigates(el) {
    var page = el.closest('.page');
    var next_page_id = page.attr("data-next");
    userClick = true;
    History.pushState({ page_id: next_page_id }, $('title').text(), pathFromId(next_page_id));
  }

  function idFromPath(path) {
    if (path != "/") {
      return path.replace("/p/", "page_");
    } else {
      return default_page_id;
    }
  }

  function pathFromId(id) {
    return "/p/" + id.replace("page_", "");
  }

  function divert(page_id) {
    $('.pages').append(box2.find('.page').hide());
    box2.append($('#' + page_id).show());
    box1.find('.page').attr('data-next', page_id);
  }

});

function log(msg) {
  $('#log').text(msg);
}