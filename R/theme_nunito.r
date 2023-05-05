#' ggplot2 theme using custom font
#' @rdname theme_font
#' @param ... Arguments passed to `plummy::theme_custom()`
#' @export
#'
theme_nunito <- function(...) {
    theme_custom(
        base_family = "Nunito",
        base_size = 11.5,
        plot_title_family = "Nunito Semi Bold",
        plot_title_margin = 10,
        subtitle_family = "Nunito",
        subtitle_margin = 15,
        strip_text_family = "Nunito Medium",
        caption_family = "Nunito Light",
        caption_margin = 10,
        axis_title_family = "Nunito",
        axis_text_family = "Nunito Light",
        ...
    )
}

#' Import font for use in charts
#'
#' @rdname import_font
#' @importFrom extrafont font_import
#' @export
#' 
import_nunito <- function() {
    font_dir <- system.file("fonts", "nunito", package = "plummy")

    suppressWarnings(suppressMessages(extrafont::font_import(font_dir, prompt = FALSE)))

    message(
        sprintf(
            "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
            font_dir
        )
    )
}
