#' ggplot2 theme using custom font
#' @rdname theme_font
#' @param ... Arguments passed to `plummy::theme_custom()`
#' @export
#'
theme_inter <- function(...) {
    theme_custom(
        base_family = "Inter",
        base_size = 10,
        plot_title_family = "Inter Semi Bold",
        plot_title_margin = 8,
        subtitle_family = "Inter",
        subtitle_margin = 13,
        strip_text_family = "Inter Medium",
        caption_family = "Inter Light",
        axis_title_family = "Inter",
        axis_text_family = "Inter Light",
        ...
    )
}

#' Import font for use in charts
#'
#' @rdname import_font
#' @importFrom extrafont font_import
#' @export
#' 
import_inter <- function() {
    font_dir <- system.file("fonts", "inter", package = "plummy")

    suppressWarnings(suppressMessages(extrafont::font_import(font_dir, prompt = FALSE)))

    message(
        sprintf(
            "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
            font_dir
        )
    )
}
