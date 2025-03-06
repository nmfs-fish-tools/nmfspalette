library(ggplot2)

plot_fun <- function(color_name) {
  p <- ggplot(mtcars, aes(hp, mpg)) +
    geom_point(
      color = nmfs_cols(color_name),
      size = 4, alpha = .8
    )
  return(p)
}

plot_fun_scale <- function(palette_name = NULL) {
  p <- ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
    geom_point(size = 4) +
    scale_color_nmfs(palette = palette_name)
  return(p)
}

plot_fun_fill <- function(palette_name = NULL) {
  # Fill by discrete variable with different palette + remove legend (guide)
  p <- ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
    geom_bar() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    scale_fill_nmfs(palette = palette_name, discrete = FALSE)
  return(p)
}

test_that("color works", {
  # check that a non color returns NA
  p <- nmfs_cols("foo")
  expect_true(is.na(p))

  # Check that it plots for a real color
  p <- plot_fun("processblue")
  expect_true(is.ggplot(p))
})

test_that("palette works", {
  # Check that nmfs_palette returns a function
  i <- nmfs_palette("coral")
  expect_type(i, "closure")

  # Check that nmfs_palette(n) returns a vector
  i <- nmfs_palette("crustacean")(10)
  expect_equal(i, c(
    "#FFAB38", "#FF9E25", "#FF9112", "#FF8400",
    "#F37807", "#E66C0E", "#DB6015", "#BE530E",
    "#A14707", "#853B00"
  ))

  # Check that fake palette names create an error
  expect_error(nmfs_palette("foo"))
})

test_that("scale_color works", {
  # Check that it works with waves
  i <- plot_fun_scale("waves")
  expect_true(is.ggplot(i))

  # Check that it fails with non-name
  expect_error(plot_fun_scale("foo"))

  # Check default works
  p <- ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
    geom_point(size = 4) +
    scale_color_nmfs()
  expect_true(is.ggplot(p))
})

test_that("scale_fill works", {
  # Check default
  i <- plot_fun_fill("urchin")
  expect_true(is.ggplot(i))

  p <- ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
    geom_bar() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    scale_fill_nmfs()
  expect_true(is.ggplot(i))
})
