strong_palette <- c("#11A4C8", "#63C2C5", "#1D4F9F", "#0C516D", "#2A2771", "#396D35", "#80C342", "#725DA8", "#B62025", "#ED2224", "#ED1943", "#ED3995", "#7E277C", "#F7EC16", "#F8941E", "#8C2A1C", "#808080")

#' 17 color qualitative color palette from strong
#'
#' @importFrom scales manual_pal
#' @export
#' @examples
#' library(scales)
#' scales::show_col(palette_strong()(17))
#' 
palette_strong <- function() {
    manual_pal(strong_palette)
}

#' Discrete color & fill scales based on the strong palette
#'
#' See [palette_strong()].
#'
#' @md
#' @inheritDotParams ggplot2::discrete_scale -expand -position
#' @rdname scale_strong
#' @importFrom ggplot2 discrete_scale
#' @export
#' 
scale_colour_strong <- function(...) {
    discrete_scale("colour", "strong", palette_strong(), ...)
}

#' @export
#' @rdname scale_strong
#' @importFrom ggplot2 discrete_scale
#' 
scale_color_strong <- scale_colour_strong

#' @export
#' @rdname scale_strong
#' @importFrom ggplot2 discrete_scale
#' 
scale_fill_strong <- function(...) {
    discrete_scale("fill", "strong", palette_strong(), ...)
}
