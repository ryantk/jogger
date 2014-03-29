//
// Speech to text
//
var startRecordingButton = document.getElementById("start-recording");
var stopRecordingButton  = document.getElementById("stop-recording");
var interimDisplay       = document.getElementById("recognition-interim-display");
var resultsDisplay       = document.getElementById("recognition-results");

var recognition = new webkitSpeechRecognition();
recognition.continuous     = true;
recognition.interimResults = true;

$(startRecordingButton).on("click", function(){
  var finalTranscript = interimTranscript = '';

  recognition.start();

  recognition.onresult = function(event) {
    interimTranscript = '';

    for (var i = event.resultIndex; i < event.results.length; ++i) {
      if (event.results[i].isFinal) {
        finalTranscript += event.results[i][0].transcript;
      } else {
        interimTranscript += event.results[i][0].transcript;
      }
    }

    interimDisplay.innerHTML = interimTranscript;
    resultsDisplay.innerHTML = finalTranscript;
  };
});

$(stopRecordingButton).on("click", function(){
  recognition.stop();
});
//
// END Speech to text
//