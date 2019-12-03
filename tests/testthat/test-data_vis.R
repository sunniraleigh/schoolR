test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
y <- c(2, 3, 6, 6, 8, 11, 15, 15, 18)

expect_message(graph_my_data(x, y, "blue", "height", "weight", "my graph!"), "zero mean condition")
expect_message(graph_my_data(x, y, "blue", "height", "weight", "my graph!"), 5)
expect_message((graph_my_data(data = mtcars, color = "blue", ind_var = "mpg", dep_var = "disp", title = "mtcars data")$r_df), "combinations")
