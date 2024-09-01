morris_palette <- c("#4D94CC", "#34648A", "#8B658A", "#9ACD32", "#CC95CC", "#9ACD32", "#8B3A39", "#CD6601", "#CC5C5B", "#8A4500")

#' 10 color qualitative color palette from morris
#'
#' @importFrom scales manual_pal
#' @export
#' @examples
#' library(scales)
#' scales::show_col(palette_morris()(10))
#' 
palette_morris <- function() {
    manual_pal(morris_palette)
}

#' Discrete color & fill scales based on the morris palette
#'
#' See [palette_morris()].
#'
#' @md
#' @inheritDotParams ggplot2::discrete_scale -expand -position
#' @rdname scale_morris
#' @importFrom ggplot2 discrete_scale
#' @export
#' 
scale_colour_morris <- function(...) {
    discrete_scale("colour", "morris", palette_morris(), ...)
}

#' @export
#' @rdname scale_morris
#' @importFrom ggplot2 discrete_scale
#' 
scale_color_morris <- scale_colour_morris

#' @export
#' @rdname scale_morris
#' @importFrom ggplot2 discrete_scale
#' 
scale_fill_morris <- function(...) {
    discrete_scale("fill", "morris", palette_morris(), ...)
}
