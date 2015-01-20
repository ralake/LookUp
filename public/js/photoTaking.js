var desiredWidth;

$(document).ready(function() {
  console.log('onReady');
  $("#takePictureField").on("change",gotPic);
  desiredWidth = window.innerWidth;

  if(!("url" in window) && ("webkitURL" in window)) {
    window.URL = window.webkitURL;
  }

});

function gotPic(event) {
  if(event.target.files.length == 1 && event.target.files[0].type.indexOf("image/") === 0) {
    $("#yourimage").attr("src",URL.createObjectURL(event.target.files[0]));
  }
}
