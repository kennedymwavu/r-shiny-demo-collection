box::use(
  . / landing_page / ui[mod_landing_page_ui = ui]
)

#' App UI
#'
#' @export
ui <- bslib::page(
  title = "Landing Page",
  theme = bslib::bs_theme(version = 5, preset = "bootstrap"),
  lang = "en",
  tags$link(
    rel = "stylesheet",
    href = "styles.css"
  ),
  mod_landing_page_ui(id = "landing_page")
)
