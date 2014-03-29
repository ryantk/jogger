$(document).on('ready page:load', function(){
  var audioInput  = $('#audio-button-input').hide();
  var audioButton = $('#audio-button');
  var audioSubmit = $('#audio-button-submit').hide();
  var audioPreview = $('#audio-preview');
  //var audioThumbnailLink = $('#audio-thumbnail-link');

  var pickAudio = function() {
    audioInput.trigger('click');
    audioSubmit.show();
    return false;
  };

  audioButton.on('click', pickAudio);
  //audioThumbnailLink.on('click', pickAudio);

  audioInput.change(function(e){
    var files = e.currentTarget.files;

    if (files && files.length > 0) {
      var URL = window.URL || window.webkitURL;
      var audioUrl = URL.createObjectURL(files[0]);

      audioPreview.attr("controls", "true");
      audioPreview.append($('<source></source>').attr("src", audioUrl));
    }
  });
});

