#' graphs  the area and perimeter of an n-gon
#' @param ngon_coord2 a tibble output from the function map_ngon
#' @return a ggplot with the plot of the n-gon shape with radius \code{r}
#' as defined in ngon
#' @examples
#' draw_ngon(map_ngon(ngon(2,4)))
#' @import ggplot2
#' @import tibble
#' @export
draw_ngon <- function(ngon_coord2) {
  #To draw shape
  ggplot() +
    geom_polygon(data = ngon_coord2,
                 aes(x = ngon_coord2$y,
                     y = ngon_coord2$x,
                     col = factor(ngon_coord2$perimeter),
                     fill = factor(ngon_coord2$area)),
                 alpha = 0.3) +
    coord_equal() +
    labs(title = paste("Plot for", ngon_coord2$n, "- gon"),
         x = "x",
         y = "y",
         fill = "Area",
         col = "Perimeter") +
    theme_minimal()
}
