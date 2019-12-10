#' graphs and calculates the area and perimeter of a square
#' @param r a numeric input containing a positive integer
#' @param n a numeric input containing a positive integer
#' @return a dataframe containining the radius, number of sides, area, perimeter,
#' and a graph of the n-gon with radius \code{r} and sides \code{s}
#' @examples
#' ngon(3,4)
#' ngon (102,40)
#' @import ggplot2
#' @import tibble
#' @export
ngon <-  function(r, n){
  # To find the angle between each point
  angle <- 2 * pi / n

  # tibble containing all the information
  math_ngon <- tibble::tibble(
    radius = r,
    sides = n,
    area = (r^2 * n * sin(angle)) / 2,
    perimeter = (2*r*n)*sin(pi/n)
  )

  # To find the coordinates
  coords <- tibble::tibble(
    side = 0:(n-1),
    x = r * cos(side * angle),
    y = r * sin(side * angle)
  )

  #To draw shape
  shape <- ggplot() +
    geom_polygon(
      data = NULL, aes(x = coords$x, y = coords$y), colour = "black",
      fill = coords$x ) +
    labs( x = "x", y = "y")

  return(shape)

}
ngon(2,5)
