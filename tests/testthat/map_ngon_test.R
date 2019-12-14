test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

expect_is(map_ngon(ngon(1:2, 3), "data.frame"))
