library(shiny)
library(bslib)

addResourcePath(prefix = "/static", directoryPath = "./public")

#' Reset Download Button
#'
#' @param id String. Output ID of the download button to reset.
#' @param session Shiny session object. Defaults to the current reactive domain.
#'
#' @details
#' This function sends a custom message of type "end-download" to the client,
#' which should be handled by corresponding JavaScript code. The message
#' includes the namespaced button ID and inner HTML content.
#'
#' @return NULL. Called for side effects.
#'
#' @examples
#' \dontrun{
#' reset_download_button(id = "my_download")
#' }
#'
#' @kewords internal
#' @noRd
reset_download_button <- \(
  id,
  session = shiny::getDefaultReactiveDomain()
) {
  session$sendCustomMessage(
    type = "end-download",
    list(
      id = session$ns(id),
      inner_html = "<i class='fas fa-download' aria-label='download icon' role='presentation'></i> Download"
    )
  )
}

ui <- page(
  theme = bs_theme(version = 5L),
  tags$div(
    class = "container",
    tags$h3("downloading spinner"),
    tags$p("works for all download btns in your app & modules..."),
    downloadButton(
      outputId = "dnld",
      class = "btn-sm rounded-3"
    ),
    tags$p("even dynamically rendered ones..."),
    uiOutput(outputId = "myui")
  ),
  tags$script(src = "/static/main.js")
)

server <- \(input, output, session) {
  ns <- session$ns

  output$dnld <- downloadHandler(
    filename = \() {
      "iris.csv"
    },
    content = \(file) {
      on.exit({
        reset_download_button(id = "dnld")
      })
      Sys.sleep(3) # <-- simulate large file
      write.csv(iris, file)
    }
  )

  # dynamically rendered download button:
  output$myui <- renderUI({
    downloadButton(
      outputId = "dnld2",
      class = "btn-sm rounded-3"
    )
  })

  output$dnld2 <- downloadHandler(
    filename = \() {
      "iris.csv"
    },
    content = \(file) {
      on.exit({
        reset_download_button(id = "dnld2")
      })
      Sys.sleep(3)
      write.csv(iris, file)
    }
  )
}

shinyApp(ui, server)
