ui <- bslib::page(
  title = "Babynames",
  theme = bslib::bs_theme(version = 5, preset = "bootstrap"),
  lang = "en",
  tags$div(
    class = "container",
    tags$div(
      class = "my-3",
      textInput(
        inputId = "hint",
        label = "Search baby name...",
        placeholder = "eg. Josiah",
        width = "100%"
      ),
      uiOutput(outputId = "suggestions")
    )
  )
)
