box::use(
  uuid[UUIDgenerate],
  shiny[tabPanel, tabsetPanel],
  htmltools[tags, tagList, tagQuery]
)

#' Make image path
#'
#' @param name File name of the image
#' @return String
#' @export
make_img_path <- \(name) {
  file.path("img", name)
}

#' Create nav tabs
#'
#' @param ns Namespace of the module from which this function is called.
#' @param id String. `id` attribute of the nav container (`ul`) without
#' namespacing.
#' @param labels Character vector. Labels of the nav items (`li`).
#' @param active String. The active tab. Must be one of `labels`.
#' @param tab_contents List of same length as labels. Tags/contents of the
#' tabs.
#' @return [htmltools::tagList()]
#' @export
create_nav_tabs <- \(
  ns,
  id,
  labels,
  active = NULL,
  tab_contents
) {
  n <- length(labels)
  id <- ns(id)
  tab_content_id <- ns(paste0("x", UUIDgenerate()))
  tab_pane_ids <- paste0("x", UUIDgenerate(n = n)) |> lapply(ns)
  nav_item_ids <- paste0("x", UUIDgenerate(n = n)) |> lapply(ns)

  nav_items <- Map(
    f = \(label, item_id, pane_id) {
      tags$li(
        class = "nav-item flex-fill",
        role = "presentation",
        tags$button(
          class = paste("nav-link w-100", if (identical(label, active)) "active"),
          type = "button",
          id = item_id,
          role = "tab",
          `aria-selected` = if (identical(label, active)) "true" else "false",
          `aria-controls` = label,
          `data-bs-toggle` = "tab",
          `data-bs-target` = pane_id,
          label
        )
      )
    },
    labels,
    nav_item_ids,
    paste0("#", tab_pane_ids)
  )

  nav_list <- tags$ul(
    class = "nav nav-underline d-flex justify-content-around",
    id = id,
    role = "tablist",
    nav_items
  )

  active_pane <- tab_pane_ids[[which(labels == active)]]

  panes <- Map(
    f = \(nav_tab_id, pane_id, pane_content) {
      class <- paste(
        "tab-pane",
        if (identical(pane_id, active_pane)) "active show"
      )

      tags$div(
        id = pane_id,
        class = class,
        role = "tabpanel",
        `aria-labelledby` = nav_tab_id,
        pane_content
      )
    },
    nav_item_ids,
    tab_pane_ids,
    tab_contents
  )

  nav_content <- tags$div(
    id = tab_content_id,
    class = "tab-content pt-2",
    panes
  )

  tagList(
    nav_list,
    nav_content
  )
}

#' Render merchandise images
#'
#' @param img_paths Character vector. Image paths.
#' @export
render_merchandise_imgs <- \(img_paths) {
  tags$div(
    class = "row row-gap-2 column-gap-2 mx-1",
    lapply(
      X = img_paths,
      FUN = \(img_path) {
        tags$div(
          class = "col-12 col-md-3 d-flex flex-column flex-fill gap-2 py-3 about",
          tags$img(
            src = img_path,
            class = "rounded-1 about-img"
          )
        )
      }
    )
  )
}

#' Merchandise section
#'
#' @param ns Module namespace from which this function is called.
#' @export
merchandise <- \(ns) {
  cats <- paste0("cat-", 1:5, ".jpg") |> make_img_path()
  dogs <- paste0("dog-", 1:4, ".jpg") |> make_img_path()
  toys <- paste0("toy-", 1:5, ".jpg") |> make_img_path()

  tab_sets <- create_nav_tabs(
    ns = ns,
    id = "merchandise_tabs",
    labels = c("Toys", "Cats", "Dogs"),
    active = "Toys",
    tab_contents = list(
      render_merchandise_imgs(toys),
      render_merchandise_imgs(cats),
      render_merchandise_imgs(dogs)
    )
  )

  tags$div(
    id = ns("merchandise"),
    class = "container my-5 py-5",
    tab_sets
  )
}
