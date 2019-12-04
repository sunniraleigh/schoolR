#' graphs and calculates area and perimeter of a circle
#' @param x a numeric vector containing positive value(s)
#' @export
circle <- function(x){
  df <- data.frame(x)
  suppressWarnings(
    if (x < 0) {
      stop("x must be a positive number")
    } else {
      # create math
      df <- df %>%
        mutate(
          diameter = 2*x,
          perimeter = pi*diameter,
          area = pi*(x)^2
        )

      #reverse dataframe for plotting circles
      df1 <- df[order(-x),]

      #make circles
      plot <- ggplot() +
        geom_circle(aes(x0 = 0, y0 = 0, r = x, fill = x), data = df1) +
        coord_fixed() +
        geom_hline(yintercept = 0) +
        geom_vline(xintercept = 0) +
        geom_point(data = df1, aes(x = x, y = 0, color = "red")) + #points corresponding to the radius
        geom_label(data = df1, aes(x = x - .5, y = .5, label = paste("r =", x))) +
        guides(fill = guide_legend("Radius"), color = FALSE) + #deletes legend created by color
        labs(title = "Area of circle(s)")

      #print dataframe
      print(df)

      #call plot
      plot

    }
  )
}
