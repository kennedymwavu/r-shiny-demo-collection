box::use(
  shiny[actionButton],
  htmltools[tags, tagList]
)

#' Landing page hero section
#'
#' @param ns Module namespace from which this function is called.
#' @export
hero <- \(ns) {
  tags$div(
    class = "bg-dark my-5 py-5",
    tags$div(
      class = "container d-flex justify-content-around flex-wrap flex-md-nowrap gap-5 py-5",
      tags$div(
        class = "w-50",
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
          label = tags$span(
            class = "fw-bold",
            "Sign Up"
          ),
          class = "btn-primary rounded-1 px-4"
        )
      ),
      tags$div(
        tags$img(
          class = "hero-img rounded-1",
          src = file.path(
            "img",
            "garrett-jackson-oOnJWBMlb5A-unsplash.jpg"
          )
        )
      )
    )
  )
}