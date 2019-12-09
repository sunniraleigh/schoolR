#' graphs and calculates area and perimeter of a circle
#' @param r a numeric vector containing positive value(s)
#' @return A dataframe containing the radius,
#' diameter, perimeter and area and a graph of circle with radius \code{r}
#' @examples
#' circle(3)
#'
#' # You can pass a vector and it will return the result for all numbers in that vector
#' circle(2:6)
#'
#' # You can use a predefined vector
#' r <- c(1,7)
#' circle(r)
#' @importFrom tidyr %>%
#' @importFrom ggforce geom_circle
#' @import ggplot2
#' @importFrom dplyr mutate
#' @export
circle <- function(r){
  df <- data.frame(r)
  suppressWarnings(
    if (r < 0) {
      stop("x must be a positive number")
    } else {
      # create math
      df <- df %>%
        mutate(
          diameter = 2*r,
          perimeter = 2*pi*r,
          area = pi*(r)^2
        )

      # reverse dataframe for plotting circles
      # plots largest circle first
      df1 <- df[order(-r),]

      # make circles
      plot <- ggplot() +
        geom_circle(aes(x0 = 0, y0 = 0, r = r, fill = r), data = df1) +
        coord_fixed() +
        geom_hline(yintercept = 0) +
        geom_vline(xintercept = 0) +
        geom_point(data = df1, aes(x = r, y = 0, color = "red")) + # points corresponding to the radius
        geom_label(data = df1, aes(x = r - .5, y = .5, label = paste("r =", r))) +
        guides(fill = guide_legend("Radius"), color = FALSE) + # deletes legend created by color
        labs(title = "Area of circle(s)")

      #print dataframe
      print(df)

      #call plot
      plot

    }
  )
}
