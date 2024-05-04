box::use(
  shiny[actionButton],
  htmltools[tags, tagList]
)

#' Landing page hero section
#'
#' @param ns Module namespace from which this function is called.
#' @return [htmltools::tags$div()]
#' @export
hero <- \(ns) {
  words_and_sign_up <- tagList(
    tags$h2(
      class = "fw-bold",
      "Discover the perfect name for your bundle of joy"
    ),
    tags$p(
      class = "opacity-75",
      "Are you struggling to pick a name for your newborn?",
      "Our curated collection of meaningful names makes choosing the right",
      "one a joyful experience."
    ),
    actionButton(
      inputId = ns("sign_up"),
      label = "Sign Up",
      class = "btn-primary rounded-1 px-4 fw-bold"
    )
  )

  baby_img <- tags$img(
    class = "hero-img rounded-1",
    src = file.path(
      "img",
      "garrett-jackson-oOnJWBMlb5A-unsplash.jpg"
    )
  )

  tags$div(
    class = "bg-dark my-5 py-5",
    tags$div(
      class = "container my-3 my-md-5 py-md-5",
      tags$div(
        class = "row row-gap-3 flex-column-reverse flex-md-row",
        tags$div(
          class = "col-12 col-md-6",
          words_and_sign_up
        ),
        tags$div(
          class = "col-12 col-md-6 mt-3 mt-md-0",
          baby_img
        )
      )
    )
  )
}
