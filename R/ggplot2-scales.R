#' Color scale constructor for nmfs colors
#'
#' @param palette Character name of palette in `nmfs_palettes`. Default value
#' is "oceans".
#' @param discrete Boolean indicating whether color aesthetic is discrete.
#' Default is TRUE.
#' @param reverse Boolean indicating whether the palette should be reversed.
#' Default is FALSE.
#' @param ... Additional arguments passed to [ggplot2::discrete_scale()] or
#'            [ggplot2::scale_color_gradientn()], used respectively when
#'            `discrete` is TRUE or FALSE.
#' @examples
#' library(ggplot2)
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#'   geom_point(size = 4) +
#'   scale_color_nmfs("coral")
#' @export
scale_color_nmfs <- function(
  palette = "oceans",
  discrete = TRUE,
  reverse = FALSE,
  ...
) {
  pal <- nmfs_palette(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale(
      aesthetics = "colour",
      palette = pal,
      ...
    )
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for nmfs colors
#'
#' @param palette Character name of palette in `nmfs_palettes`. Default value
#' is "oceans".
#' @param discrete Boolean indicating whether color aesthetic is discrete.
#' Default value is TRUE.
#' @param reverse Boolean indicating whether the palette should be reversed.
#' Default value is FALSE.
#' @param ... Additional arguments passed to [ggplot2::discrete_scale()] or
#'            [ggplot2::scale_fill_gradientn()], used respectively when
#'            `discrete` is TRUE or FALSE.
#' @examples
#' library(ggplot2)
#' ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
#'   geom_bar() +
#'   theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
#'   scale_fill_nmfs(palette = "crustacean", discrete = FALSE)
#' @export
scale_fill_nmfs <- function(
  palette = "oceans",
  discrete = TRUE,
  reverse = FALSE,
  ...
) {
  pal <- nmfs_palette(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale(
      aesthetics = "fill",
      palette = pal,
      ...
    )
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}
