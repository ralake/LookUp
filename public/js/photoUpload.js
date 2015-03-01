function activateCamera() {
  $('#activateCamera').click(function(){
    log("cam activated");
    $('#takePictureField').click();
    $("#takePictureField").on("change", getPhoto);
  });
}

var files = [];
 
function getPhoto(event) {
  var baseFile = event.target.files[0];
  var fileToSend = {}
  if(event.target.files.length == 1 &&
  baseFile.type.indexOf("image/") === 0) {
    $('#submit_button').click(function(event) {
      event.preventDefault();
    });
    postImage(fileToSend);
    readFile(fileToSend, baseFile);
  }
}

function postImage(fileToSend) {
  $('#photoReady').watch('value', function() {
    $.ajax({url: "/roofs/" + $("#roofId").val() + "/photo",
      type: 'POST',
      data: {filename: fileToSend.filename, data: fileToSend.data},
      success: function(data, status, xhr) { console.log("image post successfull")}
    });      
    $('#submit_button').click();
  });
}

function readFile(fileToSend, baseFile) {
  var reader = new FileReader();
  reader.onload = function(event) {  
    fileToSend.filename = baseFile.name;
    fileToSend.data = event.target.result;
    $('#photoReady').attr('value', 'ready')
  };  
  reader.readAsDataURL(baseFile);
}