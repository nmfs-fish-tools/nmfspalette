test_that("nmfs_cols creates a valid plot", {
  skip_on_cran()
  skip_on_ci()
  vdiffr::expect_doppelganger(
    "nmfs_cols works inside geom_point",
    plot_nmfs_cols("processblue")
  )
})

p_discrete <- ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_nmfs(palette = "oceans", discrete = TRUE)

test_that("scale_fill works with discrete = TRUE", {
  skip_on_cran()
  skip_on_ci()
  vdiffr::expect_doppelganger(
    "scale_fill_nmfs with discrete = TRUE",
    p_discrete
  )

  expect_s3_class(
    object = scale_color_nmfs(discrete = FALSE),
    class = "ScaleContinuous"
  )
})
