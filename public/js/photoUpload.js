function greyOut(styleToApply) { $(styleToApply).css( { "width": $(document).width(), "height": $(document).height() })
  .click(function() {
    if (navigator.userAgent.match(/(iPod|iPhone|iPad)/) && navigator.userAgent.match(/AppleWebKit/)) {
        $(this).css("visibility", "hidden");
        $(styleToApply).css("visibility", "hidden");
      $('#takePictureField').click();
        $("#submit_button").fadeIn();
        $("#yourimage").fadeIn();
        $("#takePictureField").on("change",gotPic);
    } else {
      $(this).css("visibility", "hidden");
      $(styleToApply).css("visibility", "hidden");
      $('#takePictureField').click();
      $("#submit_button").fadeIn();
      $("#yourimage").fadeIn();
      $("#takePictureField").on("change",gotPic);
    }
  });
}

var files = [];
 
function gotPic(event) {
  if(event.target.files.length == 1 &&
  event.target.files[0].type.indexOf("image/") === 0) {
    
    $("#yourimage").attr("src",URL.createObjectURL(event.target.files[0]));

    $("#submit_button").click(function(event, form) {
      event.preventDefault();
      $.each(files, function(index, file) {
        $.ajax({url: "/roofs/" + $("#roofId").val() + "/photo",
          type: 'POST',
          data: {filename: file.filename, data: file.data},
          success: function(data, status, xhr) {}
        });      
      });
      files = [];
    });

    $.each(event.target.files, function(index, file) {
      var reader = new FileReader();
        reader.onload = function(event) {  
        object = {};
        object.filename = file.name;
        object.data = event.target.result;
        files.push(object);
      };  
      reader.readAsDataURL(file);
    });
  }
}
