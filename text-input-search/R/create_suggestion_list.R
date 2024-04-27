#' Create suggestion list
#'
#' @param suggestions Character vector. Items to add to the list.
#' @return [htmltools::tags$ul()]
create_suggestion_list <- \(suggestions) {
  make_li <- \(x) {
    tags$li(
      class = "list-group-item list-group-item-action border-light",
      x
    )
  }

  lis <- lapply(suggestions, make_li)

  tags$ul(class = "list-group shadow-lg", lis)
}
