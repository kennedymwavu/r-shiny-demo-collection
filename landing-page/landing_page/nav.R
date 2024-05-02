box::use(
  htmltools[tags, tagList],
  shiny[actionLink, actionButton]
)

#' Landing page nav
#'
#' @param ns Module namespace from which this function is called.
#' @return [shiny::tags$div()]
#' @export
nav <- \(ns) {
  nav_items <- lapply(
    X = c("Home", "About", "Features"),
    FUN = \(nav_item) {
      class <- paste("nav-link text-white", if (nav_item == "Home") "active")
      aria_current <- if (nav_item == "Home") "page" else NA

      tags$li(
        class = "nav-item",
        actionLink(
          inputId = tolower(nav_item),
          label = nav_item,
          class = class,
          `aria-current` = aria_current
        )
      )
    }
  )

  dropdown_items <- lapply(
    X = c("Hoodies", "Trousers", "Shoes"),
    FUN = \(dropdown_item) {
      tagList(
        tags$li(
          actionLink(
            inputId = tolower(dropdown_item),
            class = "dropdown-item",
            label = dropdown_item
          )
        ),
        if (dropdown_item == "Trousers") {
          tags$li(
            tags$hr(class = "dropdown-divider")
          )
        }
      )
    }
  )

  dropdown_menu <- tags$ul(class = "dropdown-menu", dropdown_items)

  nav <- tags$nav(
    class = "navbar navbar-expand-lg bg-dark",
    tags$div(
      class = "container-fluid",
      tags$a(
        class = "navbar-brand text-white fw-bold",
        href = "#",
        "BABYNAMES"
      ),
      tags$button(
        class = "navbar-toggler text-bg-light border-0",
        type = "button",
        `data-bs-toggle` = "offcanvas",
        `data-bs-target` = paste0("#", ns("offcanvasNavbar")),
        `aria-controls` = ns("offcanvasNavbar"),
        `aria-label` = "Toggle navigation",
        tags$span(
          class = "navbar-toggler-icon"
        )
      ),
      tags$div(
        class = "offcanvas offcanvas-end bg-dark",
        tabindex = "-1",
        id = ns("offcanvasNavbar"),
        `aria-labelledby` = ns("offcanvasNavbarLabel"),
        tags$div(
          class = "offcanvas-header",
          tags$h5(
            class = "offcanvas-title",
            id = ns("offcanvasNavbarLabel"),
            "Menu"
          ),
          tags$button(
            type = "button",
            class = "btn-close text-bg-light",
            `data-bs-dismiss` = "offcanvas",
            `aria-label` = "Close"
          )
        ),
        tags$div(
          class = "offcanvas-body",
          tags$ul(
            class = "navbar-nav justify-content-end align-items-md-center flex-grow-1 pe-3",
            nav_items,
            tags$li(
              class = "nav-item dropdown",
              tags$a(
                class = "nav-link dropdown-toggle text-white",
                href = "#",
                role = "button",
                `data-bs-toggle` = "dropdown",
                `aria-expanded` = "false",
                "Merchandise"
              ),
              dropdown_menu
            ),
            tags$li(
              class = "nav-item",
              actionButton(
                inputId = ns("login"),
                label = "Login",
                class = "btn-sm btn-primary rounded-1 px-4"
              )
            )
          )
        )
      )
    )
  )

  tags$div(
    class = "fixed-top bg-dark",
    tags$div(
      class = "container-md",
      nav
    )
  )
}
