function greyOut(styleToApply) { $(styleToApply).css( { "width": $(document).width(), "height": $(document).height() })
  .click(function() {
    $(this).css("display", "none"); $(styleToApply).css("display", "none");
    $('#takePictureField').click();
    $("#submit_button").fadeIn();
    $("#yourimage").fadeIn();
    $("#takePictureField").on("change",gotPic); 
  });
}

function gotPic(event) {
  if(event.target.files.length == 1 && 
  event.target.files[0].type.indexOf("image/") == 0) {
    $("#yourimage").attr("src",URL.createObjectURL(event.target.files[0]));
  }
}
