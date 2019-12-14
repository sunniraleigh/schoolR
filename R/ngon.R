#' creates a tibble with the an entry for the radis and number of sides
#' @param r a numeric input containing a positive integer
#' @param n a numeric input containing a positive integer
#' @return a dataframe containining the radius \code{r}, number of side \code{n}
#' @examples
#' ngon(3,4)
#' ngon (102,40)
#' @import tibble
#' @export
ngon <-  function(r, n) {
  # tibble containing all the information
  math_ngon <- tibble::tibble(
    radius = r,
    sides = n
  )
  return(math_ngon)
}
