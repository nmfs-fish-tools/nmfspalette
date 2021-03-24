nmfs_colors <- c(
  "processblue" = "#0093D0",
  "reflexblue" = "#0055A4",
  "darkblue" = "#00467F",
  "lightteal"= "#1ECAD3",
  "medteal" = "#008998",
  "darkteal"= "#007078",
  "ltgreen"  = "#93D500",
  "medgreen" = "#4C9C2E",
  "darkgreen" = "#007934",
  "custom" = "#7F7FFF",
  "medpurple" = "#625BC4",
  "darkpurple" = "#575195",
  "ltorange" = "#FF8300",
  "medorange" = "#D65F00",
  "darkorange" = "#BC4700",
  "warmred" = "#FF4438",
  "medred" = "#D02C2F",
  "darkred" = "#B2292E",
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
  
  if (is.null(cols))
    return (nmfs_colors)
  
  nmfs_colors[cols]
}

nmfs_palettes <- list(
  `oceans`  = nmfs_cols("processblue", "reflexblue", "darkblue", "white"),
  
  `waves`  = nmfs_cols("ltteal", "medteal", "darkteal", "supltgray"),
  
  `seagrass`   = nmfs_cols("ltgreen", "medgreen", "darkgreen", "ltgray"),
  
  `urchin` = nmfs_cols("custom", "medpurp", "darkpurp", "medgray"),
  
  `crustacean`  = nmfs_cols("ltorange", "medorange", "darkorange", "dkgray"),
  
  `coral` = nmfs_cols("warmred", "medred", "darkred", "supdkgray"),
  
  `regional web` = nmfs_cols("darkblue", "medteal","darkgreen","medpurple","medorange","darkred"),
  
  "secondary" = nmfs_cols("darkteal", "medgreen", "darkpurple", "supdkgray")
  
  
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
#' @param ... Additiontal arguments to pass to image()
#' @importFrom graphics box image
#' @examples 
#' display_nmfs_palette("oceans", 10)
#' @export
display_nmfs_palette <- function(name, n, ...) {
  pal <- nmfs_palette(name)(n)
  image(1:n, 1, as.matrix(1:n), col = pal, 
               xlab = paste(name), ylab = "", xaxt = "n", 
               yaxt = "n", bty = "n", ...)
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
#'  ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#'  geom_point(size = 4) +
#'    scale_color_nmfs("coral")
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
#' @examples
#' \dontrun{
#'  ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
#'  geom_bar() +
#'    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
#'    scale_fill_nmfs(palette = "crustacean", discrete=FALSE)
#' }
#'@export
scale_fill_nmfs <- function(palette = "oceans", discrete = TRUE, reverse = FALSE, ...) {
  pal <- nmfs_palette(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("fill", paste0("nmfs_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}