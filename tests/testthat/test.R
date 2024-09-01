library(testthat)
library(plummy)
# devtools::test()

testthat::context("Plummy")

test_that("Default usage", {
  expect_no_error(plummy())
  expect_error(plummy(style = NULL))
  expect_error(plummy(style = "bla"))
  expect_equal(class(plummy()), c("theme", "gg"))
  expect_no_error(plummy(family = "barlow"))
  expect_no_error(plummy(family = "inter"))
  expect_no_error(plummy(family = "lato"))
  expect_no_error(plummy(family = "nunito"))
  expect_no_error(plummy(family = "plex"))
})

testthat::context("Import")

test_that("Default usage", {
  expect_no_error(import_barlow())
  expect_no_error(import_plex())
  expect_no_error(import_inter())
  expect_no_error(import_nunito())
  expect_no_error(import_lato())
})

testthat::context("Themes")

test_that("Default usage", {
  expect_no_error(theme_grid_barlow())
  expect_no_error(theme_grid_plex())
  expect_no_error(theme_grid_inter())
  expect_no_error(theme_grid_nunito())
  expect_no_error(theme_grid_lato())
  expect_no_error(theme_grid())
})

test_that("Change params", {
  expect_no_error(theme_grid(base_family = "Arial", leg = "h"))
  expect_no_error(theme_grid(grid = FALSE))
  expect_no_error(theme_grid(grid = "X"))
  expect_no_error(theme_grid(grid = "x"))
  expect_no_error(theme_grid(axis = FALSE))
  expect_no_error(theme_grid(axis = "x"))
  expect_no_error(theme_grid(axis = "y"))
  expect_no_error(theme_grid(ticks = TRUE))
  expect_no_error(plummy(axis = FALSE))
})

test_that("Classes", {
  expect_equal(class(theme_grid()), c("theme", "gg"))
  expect_equal(class(theme_grid_barlow()), c("theme", "gg"))
  expect_equal(class(theme_grid_plex()), c("theme", "gg"))
  expect_equal(class(theme_grid_inter()), c("theme", "gg"))
  expect_equal(class(theme_grid_nunito()), c("theme", "gg"))
  expect_equal(class(theme_grid_lato()), c("theme", "gg"))
})

testthat::context("Colors")

test_that("Default usage", {
  expect_no_error(scale_color_tableau())
  expect_no_error(scale_colour_tableau())
  expect_no_error(scale_fill_tableau())
  expect_no_error(scale_color_morris())
  expect_no_error(scale_colour_morris())
  expect_no_error(scale_fill_morris())
  expect_no_error(scale_color_okabeito())
  expect_no_error(scale_colour_okabeito())
  expect_no_error(scale_fill_okabeito())
  expect_no_error(scale_color_strong())
  expect_no_error(scale_colour_strong())
  expect_no_error(scale_fill_strong())
})

test_that("Classes", {
  expect_equal(class(scale_color_tableau()), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  expect_equal(class(scale_colour_tableau()), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  expect_equal(class(scale_fill_tableau()), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
})

testthat::context("Other")

test_that("List fonts", {
  expect_no_error(list_fonts())
  expect_no_error(update_geom_font())
  expect_equal(class(list_fonts()), c("data.frame"))
})
