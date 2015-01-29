$(document).ready(function() {
  
  // Add selected class to 
  // clicked material icons
  $('.material_icon').click(function() {
    $('.material_icon').removeClass('selected');
    $(this).addClass('selected');
    $('#material-input').val($.trim($(this).text()));
  });
  
});