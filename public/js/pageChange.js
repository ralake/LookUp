$(function() {
  var userClick = false;
  var fresh = true;
  var default_page_id = "page_index";
  var num_pages = $('.pages .page').length;
  
  var box1 = $('.box-1');
  var box2 = $('.box-2');
  
  //$('body').on('click', '#page_photo .button', function(e) {
  //  console.log("OK");
  //  e.stopPropagation();
  //  e.preventDefault();
  //});
  
  FastClick.attach(document.body);
  
  document.ontouchmove = function(event){
    event.preventDefault();
  }
  
  if (window.navigator.standalone) {
    $('.arrow').hide();
  }
  
  init();
  $(window).resize(init);
  
  function log(msg) {
    $('#log').text(msg);
  }
  
  function init() {
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
  
});
