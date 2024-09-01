#' Custom ggplot2 theme
#' @param style A theme style. Options are 'grid'.
#' @param family A font family name. Options are 'barlow', 'inter', 'lato', 'nunito' and 'plex'.
#' @param ... Arguments passed to low level theme functions theme_style*_font*()
#' @export
#'
plummy <- function(style = "grid", family = "", ...) {
  styles <- c("grid")
  if (is.null(style) || !style %in% styles) stop(paste0("Parameter 'style' must be one of '", paste(styles, collapse = "', '"), "'."))

  if (style == "grid") {
    if (family == "barlow") {
      return(theme_grid_barlow(...))
    } else if (family == "inter") {
      return(theme_grid_inter(...))
    }else if (family == "lato") {
      return(theme_grid_lato(...))
    }else if (family == "nunito") {
      return(theme_grid_nunito(...))
    } else if (family == "plex") {
      return(theme_grid_plex(...))
    } else {
      return(theme_grid(base_family = family, ...))
    }
  }
}

#' Update font for geom
#' 
#' @description
#' Update font family for geom_text and geom_label
#' Note that this changes the default geom family for the whole session
#' @param family A valid font family name
#' @importFrom ggplot2 update_geom_defaults
#' @export
#' 
update_geom_font <- function(family=""){
  update_geom_defaults("text", list(family = family))
  update_geom_defaults("label", list(family = family))

  if (requireNamespace("ggrepel", quietly = TRUE)) {
    update_geom_defaults(ggrepel::GeomTextRepel, list(family = family))
    update_geom_defaults(ggrepel::GeomLabelRepel, list(family = family))
  }
}
