#' ggplot2 grid theme.
#'
#' @md
#' @param base_family,base_size Base: font family and size
#' @param scaling Font size scaling factor
#' @param title_family,title_face,title_color,title_size,title_margin Plot title: font family, face, color, size and margin
#' @param subtitle_family,subtitle_face,subtitle_color,subtitle_size,subtitle_margin Plot subtitle: font family, face, color, size and margin
#' @param strip_text_family,strip_text_face,strip_text_color,strip_text_size Facet label: font family, face, color and size
#' @param caption_family,caption_face,caption_color,caption_size,caption_margin Plot caption: font family, face, color, size and margin
#' @param axis_title_family,axis_title_face,axis_title_color,axis_title_size Axis title: font family, face, color and size
#' @param axis_text_family,axis_text_face,axis_text_color Axis text: font family, face and color
#' @param axis_title_just Axis title font justification, one of `[blmcrt]` denoting bottom, left, middle, center, right and top.
#' @param axis_text_size Font size of axis text
#' @param plot_margin Plot margin
#' @param grid Panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y` denoting major and minor gridlines)
#' @param grid_color Grid color
#' @param axis Add x or y axes? `TRUE`, `FALSE`, "`xy`". Includes axis title and axis text.
#' @param axis_color Axis color
#' @param ticks Adds ticks if `TRUE`
#' @param tsc_just Horizontal justification for title, subtitle, caption.
#' @param leg Legend position. "v" for regular vertical on the right. "h" for horizontal on top.
#' @param leg_just Legend justification
#' @param base_theme Base theme. Defaults to `theme_minimal()``.
#' @details Specify margins using `ggplot2::margin()`
#' @importFrom ggplot2 margin theme element_blank element_text element_line element_rect theme_minimal margin
#' @export
#'
theme_grid <- function(
    base_family = "",
    base_size = 10.5,
    scaling = 1.2,
    title_family = "",
    title_size = base_size * scaling^2,
    title_face = "bold",
    title_color = "#2e4053",
    title_margin = NULL,
    subtitle_family = "",
    subtitle_size = base_size * scaling,
    subtitle_face = "plain",
    subtitle_color = "#2e4053",
    subtitle_margin = NULL,
    strip_text_family = "",
    strip_text_size = base_size,
    strip_text_face = "bold",
    strip_text_color = "#2e4053",
    caption_family = "",
    caption_size = base_size / scaling,
    caption_face = "plain",
    caption_color = "#aeb6bf",
    caption_margin = margin(t = 10),
    axis_text_family = "",
    axis_text_face = "plain",
    axis_text_color = "#2e4053",
    axis_text_size = base_size / scaling,
    axis_title_family = "",
    axis_title_size = base_size / scaling,
    axis_title_face = "plain",
    axis_title_color = "#2e4053",
    axis_title_just = "rt",
    plot_margin = margin(25, 25, 25, 25),
    grid_color = "#cccccc",
    grid = TRUE,
    axis_color = "#cccccc",
    axis = TRUE,
    ticks = FALSE,
    tsc_just = 0,
    leg = "v",
    leg_just = "center",
    base_theme = theme_minimal) {
  ret <- base_theme(base_family = base_family, base_size = base_size)

  if (base_family != "" && title_family == "") title_family <- base_family
  if (base_family != "" && subtitle_family == "") subtitle_family <- base_family
  if (base_family != "" && strip_text_family == "") strip_text_family <- base_family
  if (base_family != "" && caption_family == "") caption_family <- base_family
  if (base_family != "" && axis_text_family == "") axis_text_family <- base_family
  if (base_family != "" && axis_title_family == "") axis_title_family <- base_family

  xj <- switch(tolower(substr(axis_title_just, 1, 1)),
    b = 0,
    l = 0,
    m = 0.5,
    c = 0.5,
    r = 1,
    t = 1
  )
  yj <- switch(tolower(substr(axis_title_just, 2, 2)),
    b = 0,
    l = 0,
    m = 0.5,
    c = 0.5,
    r = 1,
    t = 1
  )

  ret <- ret +
    theme(
      legend.background = element_blank(),
      legend.key = element_blank(),
      panel.border = element_blank(),
      axis.line = element_blank(),
      plot.background = element_rect(fill = "white", color = "white")
    )

  if (leg == "h") {
    ret <- ret +
      theme(
        legend.position = "top",
        legend.direction = "horizontal",
        legend.justification = leg_just
      )
  }

  if (inherits(grid, "character") || grid == TRUE) {
    ret <- ret + theme(panel.grid = element_line(color = grid_color, linewidth = 0.2))
    ret <- ret + theme(panel.grid.major = element_line(color = grid_color, linewidth = 0.2))
    ret <- ret + theme(panel.grid.minor = element_line(color = grid_color, linewidth = 0.15))

    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) ret <- ret + theme(panel.grid.major.x = element_blank())
      if (regexpr("Y", grid)[1] < 0) ret <- ret + theme(panel.grid.major.y = element_blank())
      if (regexpr("x", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.x = element_blank())
      if (regexpr("y", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.y = element_blank())
    }
  } else {
    ret <- ret + theme(panel.grid = element_blank())
  }

  if (inherits(axis, "character") | axis == TRUE) {
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        ret <- ret + theme(
          axis.text.x = element_blank(),
          axis.title.x = element_blank()
        )
      } else {
        ret <- ret + theme(
          axis.text.x = element_text(
            color = axis_text_color,
            size = axis_text_size,
            margin = margin(t = 0)
          ),
          axis.title.x = element_text(
            hjust = xj,
            color = axis_title_color,
            size = axis_title_size,
            family = axis_title_family,
            face = axis_title_face
          )
        )
      }
      if (regexpr("y", axis)[1] < 0) {
        ret <- ret + theme(
          axis.line.y = element_blank(),
          axis.title.y = element_blank()
        )
      } else {
        ret <- ret + theme(
          axis.text.y = element_text(
            color = axis_text_color,
            size = axis_text_size,
            margin = margin(r = 0)
          ),
          axis.title.y = element_text(
            hjust = yj,
            size = axis_title_size,
            family = axis_title_family,
            face = axis_title_face,
            color = axis_title_color
          ),
          axis.title.y.right = element_text(
            hjust = yj,
            size = axis_title_size,
            angle = 90,
            family = axis_title_family,
            face = axis_title_face,
            color = axis_title_color
          )
        )
      }
    } else {
      ret <- ret + theme(
        axis.text.x = element_text(
          color = axis_text_color,
          size = axis_text_size,
          margin = margin(t = 0)
        ),
        axis.title.x = element_text(
          hjust = xj,
          color = axis_title_color,
          size = axis_title_size,
          family = axis_title_family,
          face = axis_title_face
        ),
        axis.text.y = element_text(
          color = axis_text_color,
          size = axis_text_size,
          margin = margin(r = 0)
        ),
        axis.title.y = element_text(
          hjust = yj,
          size = axis_title_size,
          family = axis_title_family,
          face = axis_title_face,
          color = axis_title_color
        ),
        axis.title.y.right = element_text(
          hjust = yj,
          size = axis_title_size,
          angle = 90,
          family = axis_title_family,
          face = axis_title_face,
          color = axis_title_color
        )
      )
    }
  } else {
    ret <- ret + theme(
      axis.text = element_blank(),
      axis.title = element_blank()
    )
  }

  if (!ticks) {
    ret <- ret + theme(axis.ticks = element_blank())
    ret <- ret + theme(axis.ticks.x = element_blank())
    ret <- ret + theme(axis.ticks.y = element_blank())
  } else {
    ret <- ret + theme(axis.ticks = element_line(linewidth = 0.15))
    ret <- ret + theme(axis.ticks.x = element_line(linewidth = 0.15))
    ret <- ret + theme(axis.ticks.y = element_line(linewidth = 0.15))
    ret <- ret + theme(axis.ticks.length = grid::unit(5, "pt"))
  }

  ret <- ret +
    theme(
      strip.text = element_text(
        hjust = 0.5,
        size = strip_text_size,
        face = strip_text_face,
        family = strip_text_family,
        color = strip_text_color
      ),
      panel.spacing = grid::unit(1, "lines"),
      plot.title = element_text(
        hjust = tsc_just,
        margin = title_margin,
        size = title_size,
        family = title_family,
        face = title_face,
        color = title_color
      ),
      plot.subtitle = element_text(
        hjust = tsc_just,
        margin = subtitle_margin,
        size = subtitle_size,
        family = subtitle_family,
        face = subtitle_face,
        color = subtitle_color
      ),
      plot.caption = element_text(
        hjust = tsc_just, size = caption_size,
        margin = caption_margin,
        family = caption_family,
        face = caption_face,
        color = caption_color
      ),
      plot.margin = plot_margin
    )

  return(ret)
}
