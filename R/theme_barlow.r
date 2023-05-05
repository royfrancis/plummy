#' ggplot2 theme using custom font
#'
#' @md
#' @note You should import fonts first and also install the fonts on your
#' system before trying to use this theme.
#'
#' @rdname theme_font
#' @param ... Arguments passed to `plummy::theme_custom()`
#' @export
#'
theme_barlow <- function(...) {
    theme_custom(
        base_family = "Barlow",
        base_size = 11.5,
        plot_title_family = "Barlow SemiBold",
        plot_title_margin = 10,
        subtitle_family = "Barlow",
        subtitle_margin = 15,
        strip_text_family = "Barlow Medium",
        caption_family = "Barlow Light",
        caption_margin = 10,
        axis_title_family = "Barlow",
        axis_text_family = "Barlow Light",
        ...
    )
}

#' Import font for use in charts
#'
#' @md
#' @note Remember to run `extrafont::loadfonts()` after import. The location of the
#'   font directory is displayed after the base import is complete. It is highly
#'   recommended that you install them on your system the same way you would any
#'   other font you wish to use in other programs.
#' @rdname import_font
#' @importFrom extrafont font_import
#' @export
#' 
import_barlow <- function() {
    font_dir <- system.file("fonts", "barlow", package = "plummy")

    suppressWarnings(suppressMessages(extrafont::font_import(font_dir, prompt = FALSE)))

    message(
        sprintf(
            "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
            font_dir
        )
    )
}
