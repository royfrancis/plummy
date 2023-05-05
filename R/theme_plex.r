#' ggplot2 theme using custom font
#' @rdname theme_font
#' @param ... Arguments passed to `plummy::theme_custom()`
#' @export
#'
theme_plex <- function(...) {
    theme_custom(
        base_family = "IBM Plex Sans",
        base_size = 11.5,
        plot_title_family = "IBM Plex Sans SemiBold",
        plot_title_margin = 10,
        subtitle_family = "IBM Plex Sans",
        subtitle_margin = 15,
        strip_text_family = "IBM Plex Sans Medium",
        caption_family = "IBM Plex Sans Light",
        caption_margin = 10,
        axis_title_family = "IBM Plex Sans",
        axis_text_family = "IBM Plex Sans Light",
        ...
    )
}

#' Import font for use in charts
#'
#' @rdname import_font
#' @importFrom extrafont font_import
#' @export
#' 
import_plex <- function() {
    font_dir <- system.file("fonts", "ibmplexsans", package = "plummy")

    suppressWarnings(suppressMessages(extrafont::font_import(font_dir, prompt = FALSE)))

    message(
        sprintf(
            "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
            font_dir
        )
    )
}
