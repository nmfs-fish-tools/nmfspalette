nmfs_colors <- c(
  "o66white" = "#A6D4EC",
  "o33white" = "#54ADDB",
  "processblue" = "#0085CA",
  "reflexblue" = "#003087",
  "national" = "#002364",
  "o50pblack" = "#001743",
  "w66white" = "#B3EDEF",
  "w33white" = "#6DDBE1",
  "w30black" = "#005761",
  "w50black" = "#003A40",
  "S66white" = "#CEE8B1",
  "S50black" = "#234515",
  "S33white" = "#A2D269",
  "S30black" = "#234515",
  "U66white" = "#CFCFFF",
  "U50black" = "#28225C",
  "U33white" = "#A2A2FF",
  "U30black" = "#3D348A",
  "CR66white" = "#FFD4A6",
  "CR50black" = "#6A2F00",
  "CR33white" = "#FFAC54",
  "CR30black" = "#9F4700",
  "CO66white" = "#FFBEBA",
  "CO50black" = "#681617",
  "CO33white" = "#FF827A",
  "CO30black" = "#9C2122",
  "lightteal" = "#1ECAD3",
  "westcoast" = "#00797F",
  "ltgreen" = "#76BC21",
  "southeast" = "#4B8320",
  "lightpurple" = "#7171FF",
  "midatlantic" = "#5761C0",
  "ltorange" = "#FF8400",
  "alaska" = "#db6015",
  "warmred" = "#FF4438",
  "pacificislands" = "#B71300",
  "white" = "#FFFFFF",
  "supltgray" = "#E8E8E8",
  "ltgray" = "#D0D0D0",
  "medgray" = "#9A9A9A",
  "dkgray" = "#7B7B7B",
  "supdkgray" = "#646464"
)

#' Function to extract nmfs colors as hex codes
#'
#' @param ... Character names of nmfs_colors
#' @examples
#' nmfs_cols("processblue")
#' @export
nmfs_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols)) {
    return(nmfs_colors)
  }

  nmfs_colors[cols]
}

nmfs_palettes <- list(
  `oceans` = nmfs_cols("o66white", "o33white", "processblue", "reflexblue", "national", "o50pblack"),
  `waves` = nmfs_cols("w66white", "w33white", "lightteal", "westcoast", "w30black", "w50black"),
  `seagrass` = nmfs_cols("S66white", "S33white", "ltgreen", "southeast", "S30black", "S50black"),
  `urchin` = nmfs_cols("U66white", "U33white", "lightpurple", "midatlantic", "U30black", "U50black"),
  `crustacean` = nmfs_cols("CR66white", "CR33white", "ltorange", "alaska", "CR30black", "CR50black"),
  `coral` = nmfs_cols("CO66white", "CO33white", "warmred", "pacificislands", "CO30black", "CO50black"),
  `regional` = nmfs_cols("national", "westcoast", "southeast", "midatlantic", "alaska", "pacificislands")
)

#' Return function to interpolate a nmfs color palette
#'
#' @param palette Character name of palette in nmfs_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @importFrom grDevices colorRampPalette
#' @examples
#' nmfs_palette("oceans")(10)
#' @export
nmfs_palette <- function(palette = "oceans", reverse = FALSE, ...) {
  pal <- nmfs_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

#' Return function to interpolate a nmfs color palette
#'
#' @param name Character name of palette in nmfs_palettes
#' @param n Number of colors in palette
#' @param ... Additional arguments to pass to image()
#' @importFrom graphics box image
#' @examples
#' display_nmfs_palette("oceans", 10)
#' @export
display_nmfs_palette <- function(name, n, ...) {
  pal <- nmfs_palette(name)(n)
  image(1:n, 1, as.matrix(1:n),
    col = pal,
    xlab = paste(name), ylab = "", xaxt = "n",
    yaxt = "n", bty = "n", ...
  )
  box()
}


#' Color scale constructor for nmfs colors
#'
#' @param palette Character name of palette in nmfs_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#' @importFrom ggplot2 ggplot geom_point discrete_scale scale_color_gradientn aes
#' @examples
#' \dontrun{
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#'   geom_point(size = 4) +
#'   scale_color_nmfs("coral")
#' }
#' @export
scale_color_nmfs <- function(palette = "oceans", discrete = TRUE, reverse = FALSE, ...) {
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
#' @importFrom ggplot2 ggplot geom_bar theme aes discrete_scale scale_fill_gradientn
#' @examples
#' \dontrun{
#' ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
#'   geom_bar() +
#'   theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
#'   scale_fill_nmfs(palette = "crustacean", discrete = FALSE)
#' }
#' @export
scale_fill_nmfs <- function(palette = "oceans", discrete = TRUE, reverse = FALSE, ...) {
  pal <- nmfs_palette(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("nmfs_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
