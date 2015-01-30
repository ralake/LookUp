$(document).ready(function() {
  
  // Add selected class to 
  // clicked material icons
  $('.material_icon').click(function() {
    $('.material_icon').removeClass('selected');
    $(this).addClass('selected');
    $('#material-input').val($.trim($(this).text()));
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
  })
  
});