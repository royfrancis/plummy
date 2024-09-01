#' @rdname import_font
#' @importFrom sysfonts font_add
#' @export
#'
import_plex <- function() {
  font_dir <- system.file("fonts", "ibmplexsans", package = "plummy")

  font_add(
    family = "ibmplexsans", 
    regular = file.path(font_dir, "IBMPlexSans-Regular.ttf"),
    bold = file.path(font_dir, "IBMPlexSans-SemiBold.ttf"),
    italic = file.path(font_dir, "IBMPlexSans-Italic.ttf"),
    bolditalic = file.path(font_dir, "IBMPlexSans-SemiBoldItalic.ttf")
  )
  
  # font_add(family = "ibmplexsans-100-thin", file.path(font_dir, "IBMPlexSans-Thin.ttf"))
  # font_add(family = "ibmplexsans-100-thinitalic", file.path(font_dir, "IBMPlexSans-ThinItalic.ttf"))
  # font_add(family = "ibmplexsans-200-extralight", file.path(font_dir, "IBMPlexSans-ExtraLight.ttf"))
  # font_add(family = "ibmplexsans-200-extralightitalic", file.path(font_dir, "IBMPlexSans-ExtraLightItalic.ttf"))
  font_add(family = "ibmplexsans-300-light", file.path(font_dir, "IBMPlexSans-Light.ttf"))
  font_add(family = "ibmplexsans-300-lightitalic", file.path(font_dir, "IBMPlexSans-LightItalic.ttf"))
  font_add(family = "ibmplexsans-400-regular", file.path(font_dir, "IBMPlexSans-Regular.ttf"))
  font_add(family = "ibmplexsans-400-regularitalic", file.path(font_dir, "IBMPlexSans-Italic.ttf"))
  font_add(family = "ibmplexsans-500-medium", file.path(font_dir, "IBMPlexSans-Medium.ttf"))
  font_add(family = "ibmplexsans-500-mediumitalic", file.path(font_dir, "IBMPlexSans-MediumItalic.ttf"))
  font_add(family = "ibmplexsans-600-semibold", file.path(font_dir, "IBMPlexSans-SemiBold.ttf"))
  font_add(family = "ibmplexsans-600-semibolditalic", file.path(font_dir, "IBMPlexSans-SemiBoldItalic.ttf"))
  font_add(family = "ibmplexsans-700-bold", file.path(font_dir, "IBMPlexSans-Bold.ttf"))
  font_add(family = "ibmplexsans-700-bolditalic", file.path(font_dir, "IBMPlexSans-BoldItalic.ttf"))
}

#' @rdname theme_grid
#' @param ... Arguments passed to `plummy::theme_grid()`
#' @export
#'
theme_grid_plex <- function(...) {
  theme_grid(
    base_family = "ibmplexsans-400-regular",
    base_size = 11.5,
    title_family = "ibmplexsans-600-semibold",
    subtitle_family = "ibmplexsans-500-medium",
    strip_text_family = "ibmplexsans-500-medium",
    caption_family = "ibmplexsans-300-light",
    axis_title_family = "ibmplexsans-400-regular",
    axis_text_family = "ibmplexsans-300-light",
    ...
  )
}
