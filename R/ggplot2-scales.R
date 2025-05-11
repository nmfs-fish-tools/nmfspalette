#' Color scale constructor for nmfs colors
#'
#' @param palette Character name of palette in nmfs_palettes.
#' @param discrete Boolean indicating whether color aesthetic is discrete or
#' not.
#' @param reverse Boolean indicating whether the palette should be reversed.
#' @param ... Additional arguments passed to `discrete_scale()` or
#'            `scale_color_gradientn()`, used respectively when discrete is
#'            TRUE or FALSE.
#' @examples
#' \dontrun{
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#'   geom_point(size = 4) +
#'   scale_color_nmfs("coral")
#' }
#' @export
scale_color_nmfs <- function(
  palette = "oceans",
  discrete = TRUE,
  reverse = FALSE,
  ...
) {
  pal <- nmfs_palette(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("nmfs_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for nmfs colors
#'
#' @param palette Character name of palette in `nmfs_palettes`.
#' @param discrete Boolean indicating whether color aesthetic is discrete or
#'   not.
#' @param reverse Boolean indicating whether the palette should be reversed.
#' @param ... Additional arguments passed to `discrete_scale()` or
#'            `scale_fill_gradientn()`, used respectively when discrete is TRUE
#'            or FALSE.
#' @examples
#' \dontrun{
#' ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
#'   geom_bar() +
#'   theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
#'   scale_fill_nmfs(palette = "crustacean", discrete = FALSE)
#' }
#' @export
scale_fill_nmfs <- function(
  palette = "oceans",
  discrete = TRUE,
  reverse = FALSE,
  ...
) {
  pal <- nmfs_palette(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("nmfs_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
