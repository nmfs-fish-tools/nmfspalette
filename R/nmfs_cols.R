nmfs_colors <- c(
  "process_blue" = "#0093D0",
  "reflex_blue" = "#0055A4",
  "PMS_541" = "#00467FF",
  "PMS_319" = "#1ECAD3",
  "PMS_321" = "#008998",
  "PMS_322" = "#007078",
  "PMS_375" = "#93D500",
  "PMS_362" = "#4C9C2E",
  "PMS_356" = "#007934",
  "Custom" = "#7F7FFF",
  "PMS_2725" = "#625BC4",
  "PMS_7670" = "#575195",
  "PMS_151" = "#FF8300",
  "PMS_717" = "#D65F00",
  "PMS_1525" = "#BC4700",
  "warm_red" = "#FF4438",
  "PMS_711" = "#D02C2F",
  "PMS_1805" = "#B2292E",
  "white" = "#FFFFFF",
  "lt_gray_1" = "#E8E8E8",
  "lt_gray_2" = "#D0D0D0",
  "med_gray" = "#9A9A9A",
  "dk_gray_1" = "#7B7B7B",
  "dk_gray_2" = "#646464"
)

#' Function to extract nmfs colors as hex codes
#'
#' @param ... Character names of nmfs_colors 
#'
nmfs_cols <- function(...) {
  cols <- c(...)
  
  if (is.null(cols))
    return (nmfs_colors)
  
  nmfs_colors[cols]
}

nmfs_palettes <- list(
  `oceans`  = nmfs_cols("process_blue", "reflex_blue", "PMS_541", "white"),
  
  `waves`  = nmfs_cols("PMS_319", "PMS_321", "PMS_322", "lt_gray_1"),
  
  `seagrass`   = nmfs_cols("PMS_375", "PMS_362", "PMS_356", "lt_gray_2"),
  
  `urchin` = nmfs_cols("custom", "PMS_2725", "PMS_7670", "med_gray"),
  
  `crustacean`  = nmfs_cols("PMS_151", "PMS_717", "PMS_1525", "dk_gray_1"),
  
  `coral` = nmfs_cols("warm_red", "PMS_711", "PMS_1805", "dk_gray_2")
)

#' Return function to interpolate a nmfs color palette
#'
#' @param palette Character name of palette in nmfs_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
nmfs_palette <- function(palette = "main", reverse = FALSE, ...) {
  pal <- nmfs_palettes[[palette]]
  
  if (reverse) pal <- rev(pal)
  
  colorRampPalette(pal, ...)
}

#' Color scale constructor for nmfs colors
#'
#' @param palette Character name of palette in nmfs_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_color_nmfs <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- nmfs_palette(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("colour", paste0("nmfs_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for nmfs colors
#'
#' @param palette Character name of palette in nmfs_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_nmfs <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- nmfs_palette(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("fill", paste0("nmfs_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}