test_that("nmfs_palette() works", {
  # Check that nmfs_palette returns a function
  coral_palette <- nmfs_palette("coral")
  coral_palette_rev <- nmfs_palette("coral", reverse = TRUE)

  expect_type(coral_palette, "closure")

  # Check that nmfs_palette(n) returns a vector
  expect_snapshot(
    coral_palette(10)
  )
  expect_snapshot(
    coral_palette_rev(10)
  )
})

test_that("nmfs_palette() fails", {
  # Check that fake palette names create an error
  expect_snapshot(
    error = TRUE,
    nmfs_palette("foo")
  )
})
