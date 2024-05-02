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
      class = "container my-5",
      tags$div(
        class = "row bg-primary rounded-1 py-5",
        tags$div(
          class = "col-12 col-md-6 d-flex flex-column justify-content-center align-items-center",
          tags$div(
            tags$h6(
              class = "fw-bold",
              "Discover the Perfect Name for Your Little Miracle!"
            ),
            tags$p("Start Exploring Now and Find the Name that Fits Your Bundle of Joy!")
          )
        ),
        tags$div(
          class = "col-12 col-md-6 d-flex flex-column justify-content-around align-items-md-center",
          tags$div(
            actionButton(
              inputId = ns("sign_up_2"),
              label = tags$span(class = "fw-bold", "Sign up"),
              class = "btn-primary btn-sm rounded-1 border-white px-4"
            )
          )
        )
      )
    )
  )
}
