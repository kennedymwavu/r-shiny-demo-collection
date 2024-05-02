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
    hero(ns = ns),
    about,
    testimonies,
    call_to_action(ns = ns)
  )
}
