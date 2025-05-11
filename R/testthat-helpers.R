library(ggplot2)

plot_nmfs_cols <- function(color_name) {
  p <- ggplot(mtcars, aes(hp, mpg)) +
    geom_point(
      color = nmfs_cols(color_name),
      size = 4,
      alpha = .8
    )
  return(p)
}

plot_scale_color_nmfs <- function(palette_name = NULL) {
  p <- ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
    geom_point(size = 4) +
    scale_color_nmfs(palette = palette_name)
  return(p)
}

plot_scale_fill_nmfs <- function(palette_name = NULL) {
  # Fill by discrete variable with different palette + remove legend (guide)
  p <- ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
    geom_bar() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    scale_fill_nmfs(palette = palette_name, discrete = FALSE)
  return(p)
}
