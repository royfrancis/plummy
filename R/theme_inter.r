#' @rdname import_font
#' @importFrom sysfonts font_add
#' @export
#'
import_inter <- function() {
  font_dir <- system.file("fonts", "inter", package = "plummy")

  font_add(
    family = "inter",
    regular = file.path(font_dir, "Inter-Regular.ttf"),
    bold = file.path(font_dir, "Inter-SemiBold.ttf"),
    italic = file.path(font_dir, "Inter-Italic.ttf"),
    bolditalic = file.path(font_dir, "Inter-SemiBoldItalic.ttf")
  )

  # font_add(family = "inter-100-thin", file.path(font_dir, "Inter-Thin.ttf"))
  # font_add(family = "inter-100-thinitalic", file.path(font_dir, "Inter-ThinItalic.ttf"))
  # font_add(family = "inter-200-extralight", file.path(font_dir, "Inter-ExtraLight.ttf"))
  # font_add(family = "inter-200-extralightitalic", file.path(font_dir, "Inter-ExtraLightItalic.ttf"))
  font_add(family = "inter-300-light", file.path(font_dir, "Inter-Light.ttf"))
  font_add(family = "inter-300-lightitalic", file.path(font_dir, "Inter-LightItalic.ttf"))
  font_add(family = "inter-400-regular", file.path(font_dir, "Inter-Regular.ttf"))
  font_add(family = "inter-400-regularitalic", file.path(font_dir, "Inter-Italic.ttf"))
  font_add(family = "inter-500-medium", file.path(font_dir, "Inter-Medium.ttf"))
  font_add(family = "inter-500-mediumitalic", file.path(font_dir, "Inter-MediumItalic.ttf"))
  font_add(family = "inter-600-semibold", file.path(font_dir, "Inter-SemiBold.ttf"))
  font_add(family = "inter-600-semibolditalic", file.path(font_dir, "Inter-SemiBoldItalic.ttf"))
  font_add(family = "inter-700-bold", file.path(font_dir, "Inter-Bold.ttf"))
  # font_add(family = "inter-700-bolditalic", file.path(font_dir, "Inter-BoldItalic.ttf"))
  # font_add(family = "inter-800-extrabold", file.path(font_dir, "Inter-ExtraBold.ttf"))
  # font_add(family = "inter-800-extrabolditalic", file.path(font_dir, "Inter-ExtraBoldItalic.ttf"))
  # font_add(family = "inter-900-black", file.path(font_dir, "Inter-Black.ttf"))
}

#' @rdname theme_grid
#' @param ... Arguments passed to `plummy::theme_grid()`
#' @export
#'
theme_grid_inter <- function(...) {
  theme_grid(
    base_family = "inter-400-regular",
    base_size = 10,
    title_family = "inter-600-semibold",
    subtitle_family = "inter-400-regular",
    strip_text_family = "inter-500-medium",
    caption_family = "inter-300-light",
    axis_title_family = "inter-400-regular",
    axis_text_family = "inter-300-light",
    ...
  )
}
