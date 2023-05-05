#' ggplot2 custom theme using default font.
#'
#' @md
#' @param base_family,base_size Base: font family and size
#' @param scaling Font size scaling factor
#' @param plot_title_family,plot_title_face,plot_title_size,plot_title_margin Plot title: font family, face, size and margin
#' @param subtitle_family,subtitle_face,subtitle_size Plot subtitle: font family, face and size
#' @param subtitle_margin Plot subtitle margin bottom (single numeric value)
#' @param strip_text_family,strip_text_face,strip_text_size Facet label: font family, face and size
#' @param caption_family,caption_face,caption_size,caption_margin Plot caption: font family, face, size and margin
#' @param axis_title_family,axis_title_face,axis_title_size Axis title: font family, face and size
#' @param axis_text_family,axis_text_face Axis text: font family and face
#' @param axis_title_just Axis title font justification, one of `[blmcrt]` denoting bottom, left, middle, center, right and top.
#' @param axis_text_size Font size of axis text
#' @param plot_margin Plot margin (specify with `ggplot2::margin()`)
#' @param grid_col Grid color
#' @param grid Panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y` denoting major and minor gridlines)
#' @param axis_col Axis color
#' @param axis Add x or y axes? `TRUE`, `FALSE`, "`xy`". Includes axis title and axis text.
#' @param ticks Adds ticks if `TRUE`
#' @param tsc_just Horizontal justification for title, subtitle, caption.
#' @param leg Legend position. "v" for regular vertical on the right. "h" for horizontal on top.
#' @param leg_just Legend justification
#' @importFrom ggplot2 margin theme element_blank element_text element_line element_rect theme_minimal
#' @export
#'
theme_custom <- function(
    base_family = "",
    base_size = 10,
    scaling = 1.2,
    plot_title_family = "",
    plot_title_size = base_size * scaling^2,
    plot_title_face = "bold",
    plot_title_margin = 8,
    subtitle_family = "",
    subtitle_size = base_size * scaling,
    subtitle_face = "plain",
    subtitle_margin = 13,
    strip_text_family = "",
    strip_text_size = base_size,
    strip_text_face = "bold",
    caption_family = "",
    caption_size = base_size / scaling,
    caption_face = "plain",
    caption_margin = 10,
    axis_text_family = "",
    axis_text_face = "plain",
    axis_text_size = base_size / scaling,
    axis_title_family = base_family,
    axis_title_size = base_size / scaling,
    axis_title_face = "plain",
    axis_title_just = "rt",
    plot_margin = margin(30, 30, 30, 30),
    grid_col = "#cccccc", grid = TRUE,
    axis_col = "#cccccc", axis = TRUE, ticks = FALSE,
    tsc_just = 0,
    leg = "v",
    leg_just = "center") {
    ret <- ggplot2::theme_minimal(base_family = base_family, base_size = base_size)

    if (base_family != "" && plot_title_family == "") plot_title_family <- base_family
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
        theme_minimal() +
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
        ret <- ret + theme(panel.grid = element_line(color = grid_col, size = 0.2))
        ret <- ret + theme(panel.grid.major = element_line(color = grid_col, size = 0.2))
        ret <- ret + theme(panel.grid.minor = element_line(color = grid_col, size = 0.15))

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
                        size = axis_text_size,
                        margin = margin(t = 0)
                    ),
                    axis.title.x = element_text(
                        hjust = xj,
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
                        size = axis_text_size,
                        margin = margin(r = 0)
                    ),
                    axis.title.y = element_text(
                        hjust = yj,
                        size = axis_title_size,
                        family = axis_title_family,
                        face = axis_title_face
                    ),
                    axis.title.y.right = element_text(
                        hjust = yj,
                        size = axis_title_size,
                        angle = 90,
                        family = axis_title_family,
                        face = axis_title_face
                    )
                )
            }
        } else {
            ret <- ret + theme(
                axis.text.x = element_text(
                    size = axis_text_size,
                    margin = margin(t = 0)
                ),
                axis.title.x = element_text(
                    hjust = xj,
                    size = axis_title_size,
                    family = axis_title_family,
                    face = axis_title_face
                ),
                axis.text.y = element_text(
                    size = axis_text_size,
                    margin = margin(r = 0)
                ),
                axis.title.y = element_text(
                    hjust = yj,
                    size = axis_title_size,
                    family = axis_title_family,
                    face = axis_title_face
                ),
                axis.title.y.right = element_text(
                    hjust = yj,
                    size = axis_title_size,
                    angle = 90,
                    family = axis_title_family,
                    face = axis_title_face
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
        ret <- ret + theme(axis.ticks = element_line(size = 0.15))
        ret <- ret + theme(axis.ticks.x = element_line(size = 0.15))
        ret <- ret + theme(axis.ticks.y = element_line(size = 0.15))
        ret <- ret + theme(axis.ticks.length = grid::unit(5, "pt"))
    }

    ret <- ret +
        theme(
            strip.text = element_text(
                hjust = 0.5,
                size = strip_text_size,
                face = strip_text_face,
                family = strip_text_family
            ),
            panel.spacing = grid::unit(1, "lines"),
            plot.title = element_text(
                hjust = tsc_just,
                size = plot_title_size,
                margin = margin(b = plot_title_margin),
                family = plot_title_family,
                face = plot_title_face
            ),
            plot.subtitle = element_text(
                hjust = tsc_just,
                size = subtitle_size,
                margin = margin(b = subtitle_margin),
                family = subtitle_family,
                face = subtitle_face
            ),
            plot.caption = element_text(
                hjust = tsc_just, size = caption_size,
                margin = margin(t = caption_margin),
                family = caption_family,
                face = caption_face,
                color = axis_col
            ),
            plot.margin = plot_margin
        )

    return(ret)
}
