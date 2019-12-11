#' graphs and calculates the area and perimeter of a square
#' @param ngon a tibble output from the function ngon
#' @return a ggplot with the plot of the n-gon shape with radius \code{r} as defined in ngon
#' @examples
#' draw_ngon(ngon(2,4))
#'@importFrom tidyr %>%
#' @import ggplot2
#' @import tibble
#' @export
draw_ngon <- function(ngon){
  # To find the coordinates
  coords <- tibble::tibble(
    side = 0:(ngon$sides - 1),
    x = ngon$radius * cos(side * ngon$angle),
    y = ngon$radius * sin(side * ngon$angle)
  )

  #To draw shape
  shape <- ggplot() +
    geom_polygon(data = NULL, aes(x = coords$x, y = coords$y), colour = "black",
                 fill = coords$x) +
    coord_equal() +
    labs( x = "x", y = "y")

  shape

}

