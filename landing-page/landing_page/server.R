box::use(
  shiny[moduleServer]
)

#' Landinge page server
#'
#' @param id Module id.
#' @export
server <- \(id) {
  moduleServer(
    id = id,
    module = \(input, output, session) {}
  )
}
