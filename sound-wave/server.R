server <- \(input, output, session) {
  output$results <- renderUI({
    on.exit(hide_sound_wave())
    simulation <- runif(n = 5) |> round(digits = 4)
    Sys.sleep(4)
    create_list_group(simulation)
  }) |>
    bindEvent(input$simulate)
}
