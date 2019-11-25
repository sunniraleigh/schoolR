library(testthat)
library(schoolR)

test_check("schoolR")

expect_message(graph_my_data(x, y, "blue", "height", "weight", "my graph!"), "zero mean condition")
expect_is(graph_my_data(x, y, "blue", "height", "weight", "my graph!"), "ggplot")
expect_message(graph_my_data(x, y, "blue", "height", "weight", "my graph!"), 5)
expect_message((graph_my_data(data = mtcars, color = "blue", ind_var = "mpg", dep_var = "disp", title = "mtcars data")$r_df), "combinations")

