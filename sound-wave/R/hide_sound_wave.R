#' Hide sound wave
#'
#' @param session The session object.
#' @return NULL
#' @export
hide_sound_wave <- \(session = getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    type = "hide_sound_wave",
    list(msg = "Hide sound wave")
  )
}
