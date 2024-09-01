okabeito_palette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#006699", "#D55E00", "#CC79A7")

#' 8 color qualitative color palette from okabeito
#'
#' @importFrom scales manual_pal
#' @export
#' @examples
#' library(scales)
#' scales::show_col(palette_okabeito()(8))
#' 
palette_okabeito <- function() {
    manual_pal(okabeito_palette)
}

#' Discrete color & fill scales based on the okabeito palette
#'
#' See [palette_okabeito()].
#'
#' @md
#' @inheritDotParams ggplot2::discrete_scale -expand -position
#' @rdname scale_okabeito
#' @importFrom ggplot2 discrete_scale
#' @export
#' 
scale_colour_okabeito <- function(...) {
    discrete_scale("colour", "okabeito", palette_okabeito(), ...)
}

#' @export
#' @rdname scale_okabeito
#' @importFrom ggplot2 discrete_scale
#' 
scale_color_okabeito <- scale_colour_okabeito

#' @export
#' @rdname scale_okabeito
#' @importFrom ggplot2 discrete_scale
#' 
scale_fill_okabeito <- function(...) {
    discrete_scale("fill", "okabeito", palette_okabeito(), ...)
}
