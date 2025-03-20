nmfs_colors <- c(
  # original package colors (leaving in to protect users' existing code)
  "o66white" = "#A6D4EC",
  "o33white" = "#54ADDB",
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
  "lightpurple" = "#7171FF",
  "warmred" = "#FF4438",
  "white" = "#FFFFFF",
  "supltgray" = "#E8E8E8",
  "ltgray" = "#D0D0D0",
  "medgray" = "#9A9A9A",
  "dkgray" = "#7B7B7B",
  "supdkgray" = "#646464",
  "teal_green" = "#008DA8",

  # 2024 oceans colors
  "o50pblack" = "#001743",
  "national" = "#002364",
  "reflexblue" = "#003087",
  "processblue" = "#0085CA",
  "light_sea_blue" = "#5EB6D9",
  "pale_sea_blue" = "#C6E6F0",

  # 2024 waves colors
  "dark_teal_green" = "#005E5E",
  "westcoast" = "#00797F",
  "bright_teal" = "#1EBEC7",
  "pale_teal" = "#90DFE3",

  # 2024 seagrass colors
  "dark_seagrass" = "#365E17",
  "southeast" = "#4B8320",
  "ltgreen" = "#76BC21",
  "bright_seagrass" = "#B1DC6B",

  # 2024 urchin colors
  "dark_urchin" = "#3B469A",
  "midatlantic" = "#5761C0",
  "vivid_urchin" = "#737BE6",
  "bright_urchin" = "#A8B8FF",

  # 2024 crustacean colors
  "dark_crustacean" = "#853B00",
  "alaska" = "#DB6015",
  "ltorange" = "#FF8400",
  "bright_crustacean" = "#FFAB38",

  # 2024 coral colors
  "dark_coral" = "#901200",
  "pacificislands" = "#B71300",
  "vivid_coral" = "#DB2207",
  "bright_coral" = "#FF6C57",


  # 2024 NOAA core colors (fisheries version)
  # Some colors, such as noaa_sky below and reflexblue above (both #003087),
  # have the same color code but different names.
  # This is because the branding guidance has been updated.
  # We will leave the old colors as-is, and simply add the new color names (with
  # repeated color codes), for ease of use. So, users can reference the same color
  # with different names.
  "noaa_sky" = "#003087",
  "noaa_sea" = "#0085CA",
  "whale_gray" = "#323C46",
  "midnight_sky" = "#001743",
  "twilight_sky" = "#002364",
  # "light_sea_blue" # already defined above
  # "pale_sea_blue" # already defined above
  "medium_sea_blue" = "#056FB7",
  "deep_sea_blue" = "#00559B",
  "dove_gray" = "#A5AAAF",
  "gull_white" = "#FFFFFF",

  # 2024 fisheries web-only colors
  "navy_blend" = "#004391",
  "shark_gray" = "#44545F",

  # 2024 fisheries complementary colors
  # All of these palettes are identical to the oceans, waves, urchin, etc. palettes above.
  "dark_teal" = "#005E5E",
  "fisheries_teal" = "#00797F",
  "waves" = "#1EBEC7",
  # "pale_teal" # already defined above

  # "dark_seagrass" # already defined above
  "seagrass" = "#4B8320",
  "vivid_seagrass" = "#76BC21",
  # "bright_seagrass" # already defined above

  # "dark_urchin" # already defined above
  "urchin" = "#5761C0",
  # "vivid_urchin" # already defined above
  # "bright_urchin" # already defined above

  # "dark_crustacean" # already defined above
  "crustacean" = "#DB6015",
  "vivid_crustacean" = "#FF8400",
  # "bright_crustacean" # already defined above

  # "dark_coral" # already defined above
  "coral" = "#B71300",
  # "vivid_coral" # already defined above
  # "bright_coral" # already defined above


  # 2024 fisheries background & tint colors

  # "midnight_sky" # already defined above
  "sky_tint_1" = "#C2D9E3",
  "sky_tint_2" = "#D5E6ED",
  "sky_tint_3" = "#E9F3F6",
  "turtle_green" = "#283A38",
  "green_tint_1" = "#CBDAC5",
  "green_tint_2" = "#E7EFD5",
  "green_tint_3" = "#F7FAEE",

  # "whale_gray" # already defined above
  "dove_gray_tint_1" = "#A5AAAF",
  "dove_gray_tint_2" = "#CBCFD1",
  "gray_tint_3" = "#F1F2F3",


  # NOAA alert colors
  "dark_red" = "#901200",
  "red" = "#B71300",
  "vivid_red" = "#DB2207",
  "bright_red" = "#FF6C57",
  "dark_orange" = "#853B00",
  "orange" = "#DB6015",
  "vivid_orange" = "#FF8400",
  "bright_orange" = "#FFAB38",
  "dark_yellow" = "#A8821B",
  "yellow" = "#DDBB25",
  "vivid_yellow" = "#F0DE02",
  "bright_yellow" = "#FFFF65",
  "dark_green" = "#365E17",
  "green" = "#4B8320",
  "vivid_green" = "#76BC21",
  "bright_green" = "#B1DC6B"
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
  `oceans` = nmfs_cols("pale_sea_blue", "light_sea_blue", "processblue", "reflexblue", "national", "o50pblack"),
  `waves` = nmfs_cols("pale_teal", "bright_teal", "westcoast", "dark_teal_green"),
  `seagrass` = nmfs_cols("bright_seagrass", "ltgreen", "southeast", "dark_seagrass"),
  `urchin` = nmfs_cols("bright_urchin", "vivid_urchin", "midatlantic", "dark_urchin"),
  `crustacean` = nmfs_cols("bright_crustacean", "ltorange", "alaska", "dark_crustacean"),
  `coral` = nmfs_cols("bright_coral", "vivid_coral", "pacificislands", "dark_coral"),
  `regional` = nmfs_cols("national", "westcoast", "southeast", "midatlantic", "alaska", "pacificislands"),
  `complement_teal` = nmfs_cols("dark_teal", "fisheries_teal", "waves", "pale_teal"),
  `complement_seagrass` = nmfs_cols("dark_seagrass", "seagrass", "vivid_seagrass", "bright_seagrass"),
  `complement_urchin` = nmfs_cols("dark_urchin", "urchin", "vivid_urchin", "bright_urchin"),
  `complement_crustacean` = nmfs_cols("dark_crustacean", "crustacean", "vivid_crustacean", "bright_crustacean"),
  `complement_coral` = nmfs_cols("dark_coral", "coral", "vivid_coral", "bright_coral"),
  `background_sky` = nmfs_cols("midnight_sky", "sky_tint_1", "sky_tint_2", "sky_tint_3"),
  `background_green` = nmfs_cols("turtle_green", "green_tint_1", "green_tint_2", "green_tint_3"),
  `background_gray` = nmfs_cols("whale_gray", "dove_gray_tint_1", "dove_gray_tint_2", "gray_tint_3"),
  `core` = nmfs_cols("noaa_sky", "noaa_sea", "whale_gray", "midnight_sky", "twilight_sky", "light_sea_blue", "pale_sea_blue", "medium_sea_blue", "deep_sea_blue", "dove_gray", "gull_white"),
  `alert_red` = nmfs_cols("dark_red", "red", "vivid_red", "bright_red"),
  `alert_orange` = nmfs_cols("dark_orange", "orange", "vivid_orange", "bright_orange"),
  `alert_yellow` = nmfs_cols("dark_yellow", "yellow", "vivid_yellow", "bright_yellow"),
  `alert_green` = nmfs_cols("dark_green", "green", "vivid_green", "bright_green")
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
