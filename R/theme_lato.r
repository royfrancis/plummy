#' @rdname import_font
#' @importFrom sysfonts font_add
#' @export
#'
import_lato <- function() {
  font_dir <- system.file("fonts", "lato", package = "plummy")

  font_add(
    family = "lato", 
    regular = file.path(font_dir, "Lato-Regular.ttf"),
    bold = file.path(font_dir, "Lato-Bold.ttf"),
    italic = file.path(font_dir, "Lato-Italic.ttf"),
    bolditalic = file.path(font_dir, "Lato-BoldItalic.ttf")
  )
  
  # font_add(family = "lato-100-thin", file.path(font_dir, "Lato-Thin.ttf"))
  # font_add(family = "lato-100-thinitalic", file.path(font_dir, "Lato-ThinItalic.ttf"))
  font_add(family = "lato-300-light", file.path(font_dir, "Lato-Light.ttf"))
  font_add(family = "lato-300-lightitalic", file.path(font_dir, "Lato-LightItalic.ttf"))
  font_add(family = "lato-400-regular", file.path(font_dir, "Lato-Regular.ttf"))
  font_add(family = "lato-400-regularitalic", file.path(font_dir, "Lato-Italic.ttf"))
  font_add(family = "lato-700-bold", file.path(font_dir, "Lato-Bold.ttf"))
  font_add(family = "lato-700-bolditalic", file.path(font_dir, "Lato-BoldItalic.ttf"))
  # font_add(family = "lato-900-black", file.path(font_dir, "Lato-Black.ttf"))
  # font_add(family = "lato-900-blackitalic", file.path(font_dir, "Lato-BlackItalic.ttf"))
}

#' @rdname theme_grid
#' @param ... Arguments passed to `plummy::theme_grid()`
#' @export
#'
theme_grid_lato <- function(...) {
  theme_grid(
    base_family = "lato-400-regular",
    base_size = 11.5,
    title_family = "lato-700-bold",
    subtitle_family = "lato-400-regular",
    strip_text_family = "lato-400-regular",
    caption_family = "lato-300-light",
    axis_title_family = "lato-400-regular",
    axis_text_family = "lato-300-light",
    ...
  )
}
