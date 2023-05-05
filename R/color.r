tableau_palette <- c("#4E79A7", "#A0CBE8", "#F28E2B", "#FFBE7D", "#59A14F", "#8CD17D", "#B6992D", "#F1CE63", "#499894", "#86BCB6", "#E15759", "#FF9D9A", "#79706E", "#BAB0AC", "#D37295", "#FABFD2", "#B07AA1", "#D4A6C8", "#9D7660", "#D7B5A6")

#' 20 color qualitative color palette from tableau
#'
#' @importFrom scales manual_pal
#' @export
#' @examples
#' library(scales)
#' scales::show_col(palette_tableau()(20))
#' 
palette_tableau <- function() {
    manual_pal(tableau_palette)
}

#' Discrete color & fill scales based on the tableau palette
#'
#' See [palette_tableau()].
#'
#' @md
#' @inheritDotParams ggplot2::discrete_scale -expand -position
#' @rdname scale_tableau
#' @importFrom ggplot2 discrete_scale
#' @export
#' 
scale_colour_tableau <- function(...) {
    discrete_scale("colour", "tableau", palette_tableau(), ...)
}

#' @export
#' @rdname scale_tableau
#' @importFrom ggplot2 discrete_scale
#' 
scale_color_tableau <- scale_colour_tableau

#' @export
#' @rdname scale_tableau
#' @importFrom ggplot2 discrete_scale
#' 
scale_fill_tableau <- function(...) {
    discrete_scale("fill", "tableau", palette_tableau(), ...)
}
