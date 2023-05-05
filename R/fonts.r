
#' @title List all fonts
#' @description Lists all fonts, families and variants
#' @return Returns a data.frame with font, family and variant. The font is used for plotting.
#' @export
#' 
list_fonts <- function(){
    fn_rd <- function(font = NULL) {
        dfr <- data.frame(font = gsub("-", " ", gsub(".ttf|-Regular", "", list.files(system.file("fonts", font, package = "plummy")))))
        dfr$family <- font
        dfr$variant <- trimws(mapply(gsub, dfr$family, "", tolower(dfr$font)))
        dfr$variant <- ifelse(dfr$variant == "", "regular", dfr$variant)
        return(dfr)
    }

    dfr <- Reduce(rbind, lapply(list.files(system.file("fonts", package = "plummy")), fn_rd))
    dfr$font <- gsub("IBMPlexSans", "IBM Plex Sans", dfr$font)

    return(dfr)
}