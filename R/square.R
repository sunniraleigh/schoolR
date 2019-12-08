#' graphs and calculates the area and perimeter of a square
#' @param x a numeric vector containing a positive integer
#' @return a dataframe containining the length, width, area, perimeter,
#' and a graph of the square with length and width \code{x}
#' @examples
#' square(3)
#' square (2:4)
#' @import ggplot2
#' @import tibble
#' @export
square <- function(x) {
  #tibble containing information
  math <- tibble::tibble(
    length = x,
    width = x,
    area = x^2,
    perimeter = 4*x
  )

  # To find the coordinates
  coords <- tibble::tibble(
    x1 = 0,
    x2 = 0 + x,
    y1 = 0 + x,
    y2 = x2 + x
  )

  #To draw square
  ggplot() +
    geom_rect(
      data = coords, aes(xmin = x1, xmax = x2, ymin = y1, ymax = y2), colour = "black", fill = x, alpha = 0.5,
    ) +
    geom_text(data = coords, aes(x = 0, y = y1 + 0.2, label = "area:"), size = 3) +
    geom_text(data = coords, aes(x = x2/2, y = y1 + 0.2, label = math$area), size = 3) +
    geom_text(data = coords, aes(x = 0, y = y1 + 0.4, label = "perimeter:"), size = 3) +
    geom_text(data = coords, aes(x = x2/2, y = y1 + 0.4, label = math$area), size = 3) +
    scale_x_continuous(name = "width") +
    scale_y_continuous(name = "length")

  #Print table
  return(math)

}
