test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

tibble_ngon <- tibble::tibble(
  radius = 2,
  sides = 4)

expect_equal(ngon(2, 4), tibble_ngon)
