box::use(
  htmltools[tags, tagList],
  shiny[NS],
  . / nav[nav],
  . / hero[hero],
  . / about[about],
  . / testimonies[testimonies],
  . / call_to_action[call_to_action]
)

#' Landing page UI module
#'
#' @param id Module id.
#' @return [shiny::tagList()]
#' @export
ui <- \(id) {
  ns <- NS(id)

  tagList(
    nav(ns = ns),
    tags$div(
      `data-bs-spy` = "scroll",
      `data-bs-target` = ns("page_nav"),
      `data-bs-root-margin` = "0px 0px -10%",
      `data-bs-smooth-scroll` = "true",
      tabindex = "0",
      hero(ns = ns),
      about(ns = ns),
      testimonies(ns = ns),
      call_to_action(ns = ns)
    )
  )
}
