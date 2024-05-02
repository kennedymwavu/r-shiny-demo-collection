box::use(
  shiny[actionButton],
  htmltools[tags, tagList]
)

#' Call to action section
#'
#' @param ns Module namespace from which this function is called.
#' @export
call_to_action <- \(ns) {
  tags$div(
    class = "py-1",
    tags$div(
      class = "container bg-primary rounded-1 d-flex justify-content-around my-5 py-5",
      tags$div(
        class = "d-flex flex-column justify-content-center",
        tags$h6(
          class = "fw-bold",
          "Discover the Perfect Name for Your Little Miracle!"
        ),
        tags$p("Start Exploring Now and Find the Name that Fits Your Bundle of Joy!")
      ),
      tags$div(
        class = "d-flex flex-column justify-content-around",
        actionButton(
          inputId = ns("sign_up_2"),
          label = tags$span(class = "fw-bold", "Sign up"),
          class = "btn-primary btn-sm rounded-1 border-white px-4"
        )
      )
    )
  )
}
