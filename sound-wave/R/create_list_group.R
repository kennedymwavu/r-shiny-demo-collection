#' Create a bootstrap 5 list group
#'
#' @param items An iterable object. Items to include in the list group.
#' @return [shiny::tags$ol()]
#' @export
create_list_group <- \(items) {
  tags$ol(
    class = "list-group list-group-numbered w-50",
    lapply(items, \(item) {
      tags$li(
        class = "list-group-item list-group-item-success",
        item
      )
    })
  )
}
