Shiny.addCustomMessageHandler("hide_sound_wave", (msg) => {
  toggle_sound_wave();
});

function toggle_sound_wave() {
  $(".sound-wave").toggleClass("d-none");
  $("#simulate").toggleClass("d-none");
  $("#results").toggleClass("d-none");
}
