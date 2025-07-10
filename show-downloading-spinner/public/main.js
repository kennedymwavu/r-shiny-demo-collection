$(document).on("click", ".shiny-download-link", function () {
  const btn = $(this);
  const spinner =
    '<span class="spinner-border spinner-border-sm" aria-hidden="true"></span>';
  const text = '<span role="status"> Downloading... </span>';

  btn.html(spinner + text);
  btn.attr("aria-disabled", true);
  btn.addClass("disabled");
});

Shiny.addCustomMessageHandler("end-download", function (msg) {
  const btn = $("#" + msg.id);

  btn.html(msg.inner_html);
  btn.attr("aria-disabled", false);
  btn.removeClass("disabled");
});
