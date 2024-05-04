box::use(
  shiny[actionButton],
  htmltools[tags, tagList]
)

#' Call to action section
#'
#' @param ns Module namespace from which this function is called.
#' @return [htmltools::tags$div()]
#' @export
call_to_action <- \(ns) {
  sign_up_btn <- actionButton(
    inputId = ns("sign_up_2"),
    label = "Sign up",
    class = "btn-primary btn-sm rounded-1 border-white px-4 fw-bold"
  )

  words <- tagList(
    tags$h6(
      class = "fw-bold",
      "Discover the Perfect Name for Your Little Miracle!"
    ),
    tags$p(
      "Start Exploring Now and Find the Name that Fits Your Bundle of Joy!"
    )
  )

  tags$div(
    class = "row mx-1 py-1",
    tags$div(
      class = "col-12 my-5",
      tags$div(
        class = "container",
        tags$div(
          class = "row row-gap-2 bg-primary rounded-1 py-4 px-2 py-md-5 px-md-5",
          tags$div(
            class = "col-12 col-md-6",
            words
          ),
          tags$div(
            class = "col-12 col-md-6 d-flex justify-content-md-end",
            tags$div(sign_up_btn)
          )
        )
      )
    )
  )
}
