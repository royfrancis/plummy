library(testthat)
library(plummy)
# devtools::test()

test_that("all top-level symbols from R files are available", {
  expected_symbols <- c(
    "plummy", "update_geom_font", "list_fonts",
    "import_barlow", "import_inter", "import_lato", "import_nunito", "import_plex",
    "theme_grid", "theme_grid_barlow", "theme_grid_inter", "theme_grid_lato", "theme_grid_nunito", "theme_grid_plex",
    "palette_tableau", "palette_morris", "palette_okabeito", "palette_strong",
    "scale_colour_tableau", "scale_color_tableau", "scale_fill_tableau",
    "scale_colour_morris", "scale_color_morris", "scale_fill_morris",
    "scale_colour_okabeito", "scale_color_okabeito", "scale_fill_okabeito",
    "scale_colour_strong", "scale_color_strong", "scale_fill_strong"
  )

  for (sym in expected_symbols) {
    expect_true(exists(sym, mode = "function", where = asNamespace("plummy")))
  }
})

# plummy -----------------------------------------------------------------------

test_that("plummy validates style and returns a theme", {
  expect_s3_class(plummy(), "theme")
  expect_error(plummy(style = NULL), "Parameter 'style' must be one of")
  expect_error(plummy(style = "bla"), "Parameter 'style' must be one of")

  for (family in c("barlow", "inter", "lato", "nunito", "plex")) {
    expect_s3_class(plummy(family = family), "theme")
  }
})

test_that("plummy passes base family to theme_grid for custom families", {
  custom_family <- "Arial"
  th <- plummy(family = custom_family)
  expect_equal(th$text$family, custom_family)
})

# import -----------------------------------------------------------------------

test_that("font import helpers run and register expected family names", {
  expect_no_error(import_barlow())
  expect_no_error(import_plex())
  expect_no_error(import_inter())
  expect_no_error(import_nunito())
  expect_no_error(import_lato())

  families <- sysfonts::font_families()
  expect_true(all(c("barlow", "ibmplexsans", "inter", "nunito", "lato") %in% families))
})

# themes -----------------------------------------------------------------------

test_that("theme wrappers return themes", {
  expect_s3_class(theme_grid(), "theme")
  expect_s3_class(theme_grid_barlow(), "theme")
  expect_s3_class(theme_grid_plex(), "theme")
  expect_s3_class(theme_grid_inter(), "theme")
  expect_s3_class(theme_grid_nunito(), "theme")
  expect_s3_class(theme_grid_lato(), "theme")
})

test_that("theme_grid defaults and branches behave as expected", {
  th_default <- theme_grid()
  expect_equal(th_default$plot.title$margin, ggplot2::margin(b = 2))
  expect_equal(th_default$plot.subtitle$margin, ggplot2::margin(b = 6))
  expect_equal(th_default$plot.caption$margin, ggplot2::margin(t = 10))
  expect_equal(th_default$axis.title.x$margin, ggplot2::margin(t = 6))
  expect_equal(th_default$axis.title.y$margin, ggplot2::margin(r = 6))
  expect_equal(th_default$plot.title.position, "plot")
  expect_equal(th_default$plot.caption.position, "plot")

  th_grid_false <- theme_grid(grid = FALSE)
  expect_s3_class(th_grid_false$panel.grid, "element_blank")

  th_grid_x <- theme_grid(grid = "X")
  expect_s3_class(th_grid_x$panel.grid.major.y, "element_blank")
  expect_s3_class(th_grid_x$panel.grid.minor.x, "element_blank")
  expect_s3_class(th_grid_x$panel.grid.minor.y, "element_blank")

  # Explicitly exercise the branch where major Y gridlines are retained.
  th_grid_y_major <- theme_grid(grid = "Y")
  expect_s3_class(th_grid_y_major$panel.grid.major.x, "element_blank")
  expect_false(inherits(th_grid_y_major$panel.grid.major.y, "element_blank"))

  th_axis_false <- theme_grid(axis = FALSE)
  expect_s3_class(th_axis_false$axis.text, "element_blank")
  expect_s3_class(th_axis_false$axis.title, "element_blank")

  th_axis_x <- theme_grid(axis = "x")
  expect_s3_class(th_axis_x$axis.title.y, "element_blank")

  th_axis_y <- theme_grid(axis = "y")
  expect_s3_class(th_axis_y$axis.title.x, "element_blank")

  th_ticks_false <- theme_grid(ticks = FALSE)
  expect_s3_class(th_ticks_false$axis.ticks, "element_blank")

  th_ticks_true <- theme_grid(ticks = TRUE)
  expect_s3_class(th_ticks_true$axis.ticks, "element_line")

  th_leg_h <- theme_grid(leg = "h")
  expect_equal(th_leg_h$legend.position, "top")
  expect_equal(th_leg_h$legend.direction, "horizontal")

  th_panel_pos <- theme_grid(
    plot_title_position = "panel",
    plot_caption_position = "panel"
  )
  expect_equal(th_panel_pos$plot.title.position, "panel")
  expect_equal(th_panel_pos$plot.caption.position, "panel")
})

test_that("theme_grid accepts a custom base theme function", {
  custom_base_theme <- function(base_family = "", base_size = 11) {
    ggplot2::theme_classic(base_family = base_family, base_size = base_size)
  }

  expect_s3_class(theme_grid(base_theme = custom_base_theme), "theme")
})

# colors -----------------------------------------------------------------------

test_that("palette functions return expected lengths", {
  expect_length(palette_tableau()(20), 20)
  expect_length(palette_morris()(10), 10)
  expect_length(palette_okabeito()(8), 8)
  expect_length(palette_strong()(17), 17)
})

test_that("palette functions return expected leading values", {
  expect_equal(palette_tableau()(20)[1], "#4E79A7")
  expect_equal(palette_morris()(10)[1], "#4D94CC")
  expect_equal(palette_okabeito()(8)[1], "#000000")
  expect_equal(palette_strong()(17)[1], "#11A4C8")
})

test_that("scale functions return discrete scales and aliases are identical", {
  expect_no_warning(scale_color_tableau())
  expect_no_warning(scale_colour_tableau())
  expect_no_warning(scale_fill_tableau())

  expect_no_warning(scale_color_morris())
  expect_no_warning(scale_colour_morris())
  expect_no_warning(scale_fill_morris())

  expect_no_warning(scale_color_okabeito())
  expect_no_warning(scale_colour_okabeito())
  expect_no_warning(scale_fill_okabeito())

  expect_no_warning(scale_color_strong())
  expect_no_warning(scale_colour_strong())
  expect_no_warning(scale_fill_strong())

  expect_s3_class(scale_color_tableau(), "ScaleDiscrete")
  expect_s3_class(scale_colour_tableau(), "ScaleDiscrete")
  expect_s3_class(scale_fill_tableau(), "ScaleDiscrete")

  expect_s3_class(scale_color_morris(), "ScaleDiscrete")
  expect_s3_class(scale_colour_morris(), "ScaleDiscrete")
  expect_s3_class(scale_fill_morris(), "ScaleDiscrete")

  expect_s3_class(scale_color_okabeito(), "ScaleDiscrete")
  expect_s3_class(scale_colour_okabeito(), "ScaleDiscrete")
  expect_s3_class(scale_fill_okabeito(), "ScaleDiscrete")

  expect_s3_class(scale_color_strong(), "ScaleDiscrete")
  expect_s3_class(scale_colour_strong(), "ScaleDiscrete")
  expect_s3_class(scale_fill_strong(), "ScaleDiscrete")

  expect_identical(scale_color_tableau, scale_colour_tableau)
  expect_identical(scale_color_morris, scale_colour_morris)
  expect_identical(scale_color_okabeito, scale_colour_okabeito)
  expect_identical(scale_color_strong, scale_colour_strong)
})

# other ------------------------------------------------------------------------

test_that("list_fonts returns expected structure and valid paths", {
  fonts <- list_fonts()
  expect_s3_class(fonts, "data.frame")
  expect_true(all(c("name", "family", "font", "weight", "path") %in% names(fonts)))
  expect_true(nrow(fonts) > 0)
  expect_true(all(file.exists(fonts$path)))

  known_families <- tolower(unique(fonts$family))
  expect_true(all(c("barlow", "inter", "lato", "nunito") %in% known_families))
  expect_true(any(grepl("ibmplexsans", known_families)))
})

test_that("update_geom_font updates and restores text geoms without error", {
  expect_no_error(update_geom_font("barlow"))
  expect_no_error(update_geom_font(""))
})
