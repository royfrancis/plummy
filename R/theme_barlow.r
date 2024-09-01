#' Import font for use in ggplot2 graphs
#' @md
#' @rdname import_font
#' @importFrom sysfonts font_add
#' @export
#'
import_barlow <- function() {
  font_dir <- system.file("fonts", "barlow", package = "plummy")
  
  font_add(
    family = "barlow", 
    regular = file.path(font_dir, "Barlow-Regular.ttf"),
    bold = file.path(font_dir, "Barlow-SemiBold.ttf"),
    italic = file.path(font_dir, "Barlow-Italic.ttf"),
    bolditalic = file.path(font_dir, "Barlow-SemiBoldItalic.ttf")
  )

  # font_add(family = "barlow-100-thin", file.path(font_dir, "Barlow-Thin.ttf"))
  # font_add(family = "barlow-100-thinitalic", file.path(font_dir, "Barlow-ThinItalic.ttf"))
  # font_add(family = "barlow-200-extralight", file.path(font_dir, "Barlow-ExtraLight.ttf"))
  # font_add(family = "barlow-200-extralightitalic", file.path(font_dir, "Barlow-ExtraLightItalic.ttf"))
  font_add(family = "barlow-300-light", file.path(font_dir, "Barlow-Light.ttf"))
  font_add(family = "barlow-300-lightitalic", file.path(font_dir, "Barlow-LightItalic.ttf"))
  font_add(family = "barlow-400-regular", file.path(font_dir, "Barlow-Regular.ttf"))
  font_add(family = "barlow-400-regularitalic", file.path(font_dir, "Barlow-Italic.ttf"))
  font_add(family = "barlow-500-medium", file.path(font_dir, "Barlow-Medium.ttf"))
  font_add(family = "barlow-500-mediumitalic", file.path(font_dir, "Barlow-MediumItalic.ttf"))
  font_add(family = "barlow-600-semibold", file.path(font_dir, "Barlow-SemiBold.ttf"))
  font_add(family = "barlow-600-semibolditalic", file.path(font_dir, "Barlow-SemiBoldItalic.ttf"))
  font_add(family = "barlow-700-bold", file.path(font_dir, "Barlow-Bold.ttf"))
  font_add(family = "barlow-700-bolditalic", file.path(font_dir, "Barlow-BoldItalic.ttf"))
  # font_add(family = "barlow-800-extrabold", file.path(font_dir, "Barlow-ExtraBold.ttf"))
  # font_add(family = "barlow-800-extrabolditalic", file.path(font_dir, "Barlow-ExtraBoldItalic.ttf"))
  # font_add(family = "barlow-900-black", file.path(font_dir, "Barlow-Black.ttf"))
  # font_add(family = "barlow-900-blackitalic", file.path(font_dir, "Barlow-BlackItalic.ttf"))
}

#' @md
#' @rdname theme_grid
#' @param ... Arguments passed to `plummy::theme_grid()`
#' @export
#'
theme_grid_barlow <- function(...) {
  theme_grid(
    base_family = "barlow-400-regular",
    base_size = 11.5,
    title_family = "barlow-600-semibold",
    subtitle_family = "barlow-500-medium",
    strip_text_family = "barlow-500-medium",
    caption_family = "barlow-300-light",
    axis_title_family = "barlow-400-regular",
    axis_text_family = "barlow-300-light",
    ...
  )
}
