server <- \(input, output, session) {
  r_suggestions <- reactive({
    hint <- input$hint
    if (identical(hint, "")) {
      return()
    }

    found <- grep(pattern = hint, x = nms, ignore.case = TRUE, value = TRUE)

    create_suggestion_list(found)
  }) |>
    bindEvent(input$hint)

  output$suggestions <- renderUI(r_suggestions())
}
