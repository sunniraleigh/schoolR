test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

expect_is(draw_ngon(map_ngon(ngon(1, 3))), "ggplot")
