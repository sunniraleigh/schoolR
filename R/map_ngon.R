#' creates a tibble with a new row for each of the entries of the vector
#' radius, \code{r} or the vector number of sides \code{n}
#' finding the respective x and y coordinates, perimeter, and area of each entry
#' @param math_ngon a tibble created from the function coords_ngon
#' @return a tible containining the radius \code{r}, number of side \code{n},
#' area and perimeter of each the entries
#' @examples
#' map_ngon(ngon(2:3,4))
#' map_ngon(ngon (2,4:5))
#' @importFrom tidyr %>%
#' @importFrom purrr map2
#' @importFrom dplyr bind_rows
#' @export
map_ngon <- function(math_ngon) {

 ngon_coord2 <- map2(math_ngon$radius, math_ngon$sides, coords_ngon) %>%
    bind_rows()


 return(ngon_coord2)
}

