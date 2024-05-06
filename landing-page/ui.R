box::use(
  bslib[page, bs_theme],
  . / landing_page / ui[mod_landing_page_ui = ui]
)

#' App UI
#'
#' @export
ui <- page(
  title = "Landing Page",
  theme = bs_theme(version = 5, preset = "bootstrap"),
  lang = "en",
  tags$link(
    rel = "stylesheet",
    href = "styles.css"
  ),
  tags$body(
    class = "spectral-regular",
    mod_landing_page_ui(id = "landing_page")
  )
)
