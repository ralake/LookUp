function greyOut(styleToApply) { $(styleToApply).css( { "width": $(document).width(), "height": $(document).height() })
  .click(function() {
    $(this).css("visibility", "hidden");
    $(styleToApply).css("visibility", "hidden");
    $('#takePictureField').click();
    $("#submit_button").fadeIn();
    $("#yourimage").fadeIn();
    $("#takePictureField").on("change",gotPic);
    if (navigator.userAgent.search("Safari") >= 0 && navigator.userAgent.search("Chrome") < 0)
    {
      $("#takePictureField").click();
    }
  });
}

function gotPic(event) {
  if(event.target.files.length == 1 &&
  event.target.files[0].type.indexOf("image/") === 0) {
    $("#yourimage").attr("src",URL.createObjectURL(event.target.files[0]));
  }
}

function myFunction(){
  $("#takePictureField").click();
}
