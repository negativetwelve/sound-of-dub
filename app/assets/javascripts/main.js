$(document).ready(function(){
  $("#jquery_jplayer_1").jPlayer({
    ready: function () {
      $(this).jPlayer("setMedia", {
        mp3: "/demo.mp3",
      }).jPlayer("play"); // auto play
    },
    ended: function (event) {
      $(this).jPlayer("play");
    },
    swfPath: "/swf",
    supplied: "mp3"
  })
  .bind($.jPlayer.event.play, function() { // pause other instances of player when current one play
    $(this).jPlayer("pauseOthers");
  });
});