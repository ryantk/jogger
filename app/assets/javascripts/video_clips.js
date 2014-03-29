$(document).on('ready page:load', function(){
  var videoInput  = $('#video-button-input').hide();
  var videoButton = $('#video-button');
  var videoSubmit = $('#video-button-submit').hide();
  var videoPreview = $('#video-preview');
  var videoThumbnailLink = $('#video-thumbnail-link');

  var pickVideo = function() {
    videoInput.trigger('click');
    videoSubmit.show();
    return false;
  };

  videoButton.on('click', pickVideo);
  videoThumbnailLink.on('click', pickVideo);

  videoInput.change(function(e){
    var files = e.currentTarget.files;

    if (files && files.length > 0) {
      var URL = window.URL || window.webkitURL;
      var vidUrl = URL.createObjectURL(files[0]);

      videoPreview.attr("controls", "true");
      videoPreview.append($('<source></source>').attr("src", vidUrl));
    }
  });
});

