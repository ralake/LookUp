$(function() {
  
  var current_page = 0;
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
  
  init();
  $(window).resize(init);
  
  function init() {
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
  
    $('.page').each(function(i) {
      $(this).css({
        height: height + "px",
        width: width + "px",
        lineHeight: height-50 + "px"
      });
    });
  }
  
  current_page++;
  fillBoxWithPageHtml();
  
  function fillBoxWithPageHtml() {
    var page1 = $('.pages .page').eq(current_page-1); // 0
    var page2 = $('.pages .page').eq(current_page);  // 1
    
    box1.html(page1.clone());
    box2.html(page2.clone());
    
    $('.box .page').show();
  }
  
  $('body').on('click', '.box-1', function() {
    
    if (current_page == num_pages) {
      return;
    }
    
    box1.addClass('zoomOutSlideLeft');
    box2.addClass('slideLeftZoomIn');
    
    box2.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
      
      console.log("Done animation");
      
      current_page++;
      
      var page1 = $('.pages .page').eq(current_page-1); // 1
      var page2 = $('.pages .page').eq(current_page); // 2
      
      box1
        .html(page1.clone())
        .removeClass('zoomOutSlideLeft');
        
      box2
        .html(page2.clone())
        .removeClass('slideLeftZoomIn');
      
      $('.box .page').show();
      
    });
  });
  
});
