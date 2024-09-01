#' @rdname import_font
#' @importFrom sysfonts font_add
#' @export
#'
import_nunito <- function() {
  font_dir <- system.file("fonts", "nunito", package = "plummy")

  font_add(
    family = "nunito", 
    regular = file.path(font_dir, "Nunito-Regular.ttf"),
    bold = file.path(font_dir, "Nunito-SemiBold.ttf"),
    italic = file.path(font_dir, "Nunito-Italic.ttf"),
    bolditalic = file.path(font_dir, "Nunito-SemiBoldItalic.ttf")
  )
  
  # font_add(family = "nunito-200-extralight", file.path(font_dir, "Nunito-ExtraLight.ttf"))
  # font_add(family = "nunito-200-extralightitalic", file.path(font_dir, "Nunito-ExtraLightItalic.ttf"))
  font_add(family = "nunito-300-light", file.path(font_dir, "Nunito-Light.ttf"))
  font_add(family = "nunito-300-lightitalic", file.path(font_dir, "Nunito-LightItalic.ttf"))
  font_add(family = "nunito-400-regular", file.path(font_dir, "Nunito-Regular.ttf"))
  font_add(family = "nunito-400-regularitalic", file.path(font_dir, "Nunito-Italic.ttf"))
  font_add(family = "nunito-500-medium", file.path(font_dir, "Nunito-Medium.ttf"))
  font_add(family = "nunito-500-mediumitalic", file.path(font_dir, "Nunito-MediumItalic.ttf"))
  font_add(family = "nunito-600-semibold", file.path(font_dir, "Nunito-SemiBold.ttf"))
  font_add(family = "nunito-600-semibolditalic", file.path(font_dir, "Nunito-SemiBoldItalic.ttf"))
  font_add(family = "nunito-700-bold", file.path(font_dir, "Nunito-Bold.ttf"))
  font_add(family = "nunito-700-bolditalic", file.path(font_dir, "Nunito-BoldItalic.ttf"))
  # font_add(family = "nunito-800-extrabold", file.path(font_dir, "Nunito-ExtraBold.ttf"))
  # font_add(family = "nunito-800-extrabolditalic", file.path(font_dir, "Nunito-ExtraBoldItalic.ttf"))
  # font_add(family = "nunito-900-black", file.path(font_dir, "Nunito-Black.ttf"))
  # font_add(family = "nunito-900-blackitalic", file.path(font_dir, "Nunito-BlackItalic.ttf"))
}

#' @rdname theme_grid
#' @param ... Arguments passed to `plummy::theme_grid()`
#' @export
#'
theme_grid_nunito <- function(...) {
  theme_grid(
    base_family = "nunito-400-regular",
    base_size = 11.5,
    title_family = "nunito-600-semibold",
    subtitle_family = "nunito-500-medium",
    strip_text_family = "nunito-500-medium",
    caption_family = "nunito-300-light",
    axis_title_family = "nunito-400-regular",
    axis_text_family = "nunito-300-light",
    ...
  )
}
