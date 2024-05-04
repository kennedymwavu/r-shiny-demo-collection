box::use(
  . / landing_page / server[mod_landing_page_server = server]
)

#' App server
#'
#' @export
server <- \(input, output, session) {
  mod_landing_page_server(id = "landing_page")
}
