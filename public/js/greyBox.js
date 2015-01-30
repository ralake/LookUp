var browserType;

function browserDetect(){
  browserType = detect.parse(navigator.userAgent);
  console.log(browserType.browser.family);
}

function greyOut(styleToApply) { $(styleToApply).css( { "width": $(document).width(), "height": $(document).height() })
  .click(function() {
    $(this).css("visibility", "hidden");
    $(styleToApply).css("visibility", "hidden");
    $('#takePictureField').click();
    $("#submit_button").fadeIn();
    $("#yourimage").fadeIn();
    $("#takePictureField").on("change",gotPic);
    // if (browserType.browser.family === 'Mobile Safari')
    // {
    //   $("#takePictureField").click();
    // }
  });
}

function gotPic(event) {
  if(event.target.files.length == 1 &&
  event.target.files[0].type.indexOf("image/") === 0) {
    $("#yourimage").attr("src",URL.createObjectURL(event.target.files[0]));
  }
}

function myFunction(){
  if (browserType.browser.family === 'Mobile Safari' || browserType.browser.family === 'Chrome Mobile iOS' ) {
  $("#takePictureField").click(); }
}
