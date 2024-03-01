#' Create a sound wave div
#'
#' @param id id of the div
#' @param class additional classes to apply to the div
#' @return [shiny::tags$div()]
#' @export
create_sound_wave <- \(
  id = NULL,
  class = NULL
) {
  tags$div(
    id = id,
    class = paste("sound-wave d-none", class),
    replicate(n = 5, tags$div(), simplify = FALSE)
  )
}
