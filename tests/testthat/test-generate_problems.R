test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

expect_is(generate_problems("add", 1, 22, 7), "data.frame")

