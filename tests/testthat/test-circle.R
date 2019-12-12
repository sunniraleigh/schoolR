test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

expect_error(circle(-3), "x must be a positive number")

expect_equal(class(circle(2)$plot_env$plot), c("gg", "ggplot"))
