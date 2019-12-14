#' creates a tibble with the an entry for the radius, number of sides,
#'  x and y coordinates, perimeter, and area of shape
#' @param r a numeric input containing a positive integer
#' @param n a numeric input containing a positive integer
#' @return a dataframe containining the radius \code{r}, number of side \code{n}
#' @examples
#' ngon(3,4)
#' ngon (102,40)
#' @import tibble
#' @export
coords_ngon <-  function(r, n) {
  # To find the angle between each point
  angle <- 2 * pi / n

  #To find base and height of the triangles
  base <- sin(angle / 2) * r
  height <- cos(angle / 2) * r

  # To find the coordinates
  coords <- tibble::tibble(
    side = 0:(n - 1),
    n = n,
    radius = r,
    x = r * cos(side * angle),
    y = r * sin(side * angle),
    perimeter = (2 * r * n) * sin(pi / n),
    area = (base * height / 2) * n

  )

  return(coords)
}

