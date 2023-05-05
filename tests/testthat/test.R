# Test Script

library(testthat)
library(plummy)
#devtools::test()

# pixgallery -------------------------------------------------------------------

# runs without error
expect_silent(plummy::scale_color_tableau())
expect_silent(plummy::scale_colour_tableau())
expect_silent(plummy::scale_fill_tableau())
expect_silent(plummy::theme_custom())
expect_silent(plummy::theme_barlow())
expect_silent(plummy::theme_plex())
expect_silent(plummy::theme_inter())
expect_silent(plummy::theme_nunito())
expect_silent(plummy::list_fonts())

# expected class
expect_equal(class(plummy::scale_color_tableau()), c("ScaleDiscrete","Scale","ggproto","gg"))
expect_equal(class(plummy::scale_colour_tableau()), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
expect_equal(class(plummy::scale_fill_tableau()), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
expect_equal(class(plummy::theme_custom()), c("theme", "gg"))
expect_equal(class(plummy::theme_barlow()), c("theme", "gg"))
expect_equal(class(plummy::theme_plex()), c("theme", "gg"))
expect_equal(class(plummy::theme_inter()), c("theme", "gg"))
expect_equal(class(plummy::theme_nunito()), c("theme", "gg"))
expect_equal(class(plummy::list_fonts()), c("data.frame"))
