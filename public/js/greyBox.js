function greyOut(styleToApply) { $(styleToApply).css( { "width": $(document).width(), "height": $(document).height() })
  .click(function() {
    $(this).css("display", "none"); $(styleToApply).css("display", "none");
    $("#submit_button").fadeIn();
    $("#yourimage").fadeIn();
    $("#takePictureField").on("change",gotPic);
    $("#takePictureField").click();
  });
}

function gotPic(event) {
  if(event.target.files.length == 1 &&
  event.target.files[0].type.indexOf("image/") === 0) {
    $("#yourimage").attr("src",URL.createObjectURL(event.target.files[0]));
  }
}

function myFunction(){ $("#takePictureField").click(); }
