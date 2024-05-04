box::use(
  htmltools[tags, tagList]
)

#' Create About section
#'
#' @param ns Module namespace from which this function is called.
#' @param image List or character vector. Names of images to include.
#' The images are assumed to be in the 'www/img/' dir.
#' @param description List or character vector of same length as `image`.
#' Descriptions to use under those images.
#' @return [htmltools::tags$div()]
#' @export
create_about <- \(ns, image = NULL, description = NULL) {
  heading <- tags$h3(
    class = "fw-bold text-center my-5",
    "Take a Sneak Peek..."
  )

  imgs_and_descripts <- tags$div(
    class = "row row-gap-2 column-gap-2 mx-1",
    Map(
      f = \(img, desc) {
        tags$div(
          class = "col-12 col-md-3 d-flex flex-column flex-fill gap-2 py-3 about",
          tags$img(
            src = file.path("img", img),
            class = "rounded-1 about-img"
          ),
          tags$p(
            class = "opacity-75",
            desc
          )
        )
      },
      image,
      description
    )
  )

  tags$div(
    id = ns("about"),
    class = "container",
    heading,
    imgs_and_descripts
  )
}

#' About section (below hero)
#'
#' @param ns Module namespace from which this function is called.
#' @return [htmltools::tags$div()]
#' @export
about <- \(ns) {
  create_about(
    ns = ns,
    image = paste0("baby-", 1:4, ".jpg"),
    description = list(
      "With her bright eyes and a tuft of curly brown hair, Olivia is a bundle of joy. Always sporting a contagious smile, she's the epitome of happiness. Olivia loves cuddles and giggles, and her gentle demeanor makes everyone around her feel at ease. She's curious about the world, often reaching out to touch and explore everything within her grasp.",
      "Meet Ethan, a little explorer with an insatiable curiosity. With his twinkling blue eyes and a sprinkle of freckles across his nose, he's always ready for his next adventure. Whether he's crawling around the room or babbling away, Ethan's energy is infectious. He loves discovering new toys and babbling in his own baby language, captivating everyone with his adorable antics.",
      "Ava is a little princess with a heart-melting smile. With her silky blonde locks and big, expressive eyes, she charms everyone she meets. She's a natural entertainer, often giggling and cooing to captivate her audience. Ava loves to be held and rocked gently, relishing in the warmth of cuddles and affection. She's a gentle soul with a radiant presence that brightens up any room.",
      "Noah is a little bundle of mischief wrapped in chubby cheeks and dimples. With his tousled brown hair and twinkling eyes, he's always up to something mischievous. Whether he's babbling away or reaching for his favorite toys, Noah's playful energy is contagious. He loves to explore and experiment, often surprising everyone with his clever antics. Noah is a little firecracker, keeping everyone on their toes with his boundless enthusiasm."
    )
  )
}
