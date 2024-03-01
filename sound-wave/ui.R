ui <- bslib::page(
  title = "Sound Wave",
  lang = "en",
  tags$head(
    tags$link(rel = "stylesheet", href = "styles.css")
  ),
  tags$body(
    class = "bg-dark vh-100",
    tags$div(
      class = "container",
      tags$h3(
        class = "mt-5 mb-4",
        "Sound Wave"
      ),
      actionButton(
        inputId = "simulate",
        label = "Simulate",
        class = "btn-success rounded-1",
        onclick = "toggle_sound_wave()"
      ),
      create_sound_wave(),
      uiOutput(
        outputId = "results",
        class = "my-4"
      )
    ),
    tags$script(src = "script.js")
  )
)
