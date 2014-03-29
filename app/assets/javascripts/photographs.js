$(document).on('ready page:load', function(){
  var cameraInput  = $('#camera-button-input').hide();
  var cameraButton = $('#camera-button');
  var cameraSubmit = $('#camera-button-submit').hide();
  var imagePreview = $('#camera-image-preview');
  var cameraThumbnailLink = $('#camera-thumbnail-link');

  var pickImage = function() {
    cameraInput.trigger('click');
    cameraSubmit.show();
    return false;
  };

  cameraButton.on('click', pickImage);
  cameraThumbnailLink.on('click', pickImage);

  cameraInput.change(function(e){
    var files = e.target.files;

    if (files && files.length > 0) {
      var URL = window.URL || window.webkitURL;
      var imgURL = URL.createObjectURL(files[0]);

      imagePreview.attr("src", imgURL);

      URL.revokeObjectURL(imgURL);
    }
  });
});
