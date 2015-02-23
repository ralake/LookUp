function initCamera() {
  var files = [];
  
  $('#btn-choose-photo').click(function(){

    $('#takePictureField').click();
    
    $("#takePictureField").on("change", function(event) {
      var el = $(this);
      var baseFile = event.target.files[0];
      var fileToSend = {}
      
      if(event.target.files.length == 1 &&
      baseFile.type.indexOf("image/") === 0) {
        
        var reader = new FileReader();
        reader.onload = function(event) { 
          
          $.ajax({url: "/roofs/" + $("#roofId").val() + "/photo",
            type: 'POST',
            data: { filename: baseFile.name, data: event.target.result },
            success: function(data, status, xhr) { console.log("image post successfull")}
          });      
    
          $('#btn-after-photo').click();
        
        };  
        
        reader.readAsDataURL(baseFile);
        
      }
      
    });
    
  });

}