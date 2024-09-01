#' @title List all fonts
#' @description Lists all fonts and families.
#' @return Returns a data.frame with name, family, font, weight and path. The name is used as 'family' when plotting.
#' @export
#'
list_fonts <- function() {
  fn_rd <- function(font = NULL) {
    fn_wgt <- function(x) {
      wgts <- c("Thin" = 100, "ExtraLight" = 200, "Light" = 300, "Regular" = 400, "Italic" = 400, "Medium" = 500, "SemiBold" = 600, "Bold" = 700, "ExtraBold" = 800, "Black" = 900)
      return(wgts[grepl(paste0("^", x, "$"), names(wgts))])
    }

    paths <- list.files(system.file("fonts", font, package = "plummy"), pattern = ".ttf", full.names = TRUE)
    bnames <- basename(paths)
    fam <- sapply(strsplit(bnames, split = "-"), "[[", 1)
    fnt <- sub(".ttf", "", sapply(strsplit(bnames, split = "-"), "[[", 2))
    wt <- as.integer(unlist(sapply(sub("Italic", "", sub("^Italic$", "Regular", fnt)), fn_wgt)))


    dfr <- data.frame(
      name = paste0(tolower(fam), "-", wt, "-", tolower(fnt)),
      family = fam,
      font = fnt,
      weight = wt,
      path = paths
    )

    return(dfr)
  }

  dfr <- Reduce(
    rbind,
    lapply(
      list.files(path = system.file("fonts", package = "plummy")),
      fn_rd
    )
  )
  dfr$font <- gsub("IBMPlexSans", "IBM Plex Sans", dfr$font)

  return(dfr)
}
