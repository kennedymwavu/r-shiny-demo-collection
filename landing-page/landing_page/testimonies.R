box::use(
  htmltools[tags, tagList]
)

#' Testimonies from clients
#'
#' @export
testimonies <- tags$div(
  class = "bg-light my-5 py-5",
  tags$div(
    class = "container d-flex justify-content-center my-5 py-5",
    tags$div(
      tags$p(
        class = "fst-italic fs-3 fw-light",
        r'{"What's in a name? That which we call a rose by any other name would smell just as sweet."}'
      ),
      tags$p(
        class = "text-end fw-bold",
        "- William Shakespeare"
      )
    )
  )
)
