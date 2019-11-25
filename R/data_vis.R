#' graphs a given set of data
#' @param x a numeric vector
#' @param y a numeric vector
#' @param color a string; must be a color recognized by ggplot
#' @param ind_var a string of the variable name to be assessed; if using `data`, the vector of this variable name must have numerical values
#' @param dep_var a string of the variable name to be assessed; if using `data`, the vector of this variable name must have numerical values
#' @param title a string
#' @param data
#' @exporta data frame; default value is NULL, so that if manually entering data as x and y vectors this is not involved
graph_my_data <- function(x, y, color, ind_var, dep_var, title, data = NULL){
  UseMethod("graph_my_data")
}


#' @export
#' @rdname graph_my_data
graph_my_data.numeric <- function(x, y, color, ind_var, dep_var, title, data = NULL) {

  # plot scatterplot between x and y to check for linearity
  scatterplot <- ggplot(data, aes(x = x, y = y)) +
    geom_point() +
    ggtitle(paste("Scatter plot between", ind_var, "and", dep_var))
  message("Check: is the scatterplot linear? \n")

  # find r and interpret
  r <- cor(x, y)
  message(paste("The Pearson Linear Correlation Coefficient, r, for your data is:", r, " \n"))
  if (as.numeric(r) > 0.8) {
    message("This suggests a strong positive linear correlation! \n")
    correlation = "strong positive"
  }
  else if (as.numeric(r) > 0.4) {
    message("This suggests a moderate positive linear correlation. \n")
    correlation = "moderate positive"
  }
  else if (as.numeric(r) < -0.8) {
    message("This suggests a strong negative linear correlation! \n")
    correlation = "strong negative"
  }
  else if (as.numeric(r) < -0.4) {
    message("This suggests a moderate negative linear correlation. \n")
    correlation = "moderate negative"
  }
  else{
    message("This suggests a weak relationship. \n")
    correlation = "weak"
  }

  # regress x onto y
  mod <- lm(y ~ x)

  # find residuals for the simple linear regression model
  residuals <- resid(mod)
  # find the mean of the residuals and interpret
  m <- mean(residuals)
  if (as.numeric(m) < 0.01) {
    message("The zero mean condition holds! \n")
  }
  else{
    #stop running the function if the condition does not hold
    stop("The zero mean condition does not hold \n")
  }

  # find predicted values based on the model
  predValues <- predict(mod)
  res_data <- data.frame("predValues" = predValues, "residuals" = residuals)

  # plot the predicted values against the residuals to check for linearity and constant variance
  res_plot <- ggplot(data = res_data, aes(x = predValues, y = residuals)) +
    geom_point() +
    ggtitle("Residuals")
  message("Check: is there a non-linear trend in the residuals? Is there constant variance? \n")

  # graph histogram of residuals to check for normality
  histogram <- ggplot(data = res_data, aes(x = residuals)) +
    geom_histogram(binwidth = 1)

  # plot Q-Q Plot to check for normality
  qqplot <- ggplot(res_data, aes(sample = residuals)) +
    stat_qq()

  # remind user to check normality based on plot outputs
  message("Check: is the data relatively normal? \n")

  # find the coefficients of the model to then print the LSRL equation
  coeff <- coefficients(mod)
  intercept <- (coeff[1])
  slope <- (coeff[2])
  message(paste("The equation for your line of best fit is: Y = ", intercept, "+ ", slope, "X \n"))

  # find mean and median of bth variables
  mean_x <- mean(x)
  mean_y <- mean(y)
  median_x <- median(x)
  median_y <- median(y)

  message(paste("The mean of", ind_var, "is:", mean_x, "and the mean of", dep_var, "is:", mean_y, " \n"))
  message(paste("The median of", ind_var, "is:", median_x, "and the median of", dep_var, "is:", median_y, " \n"))

  output <- data.frame(r = r, "correlation" = correlation, "intercept" = intercept, "slope" = slope, "mean_x" = mean_x, "mean_y" = mean_y, "median_x" = median_x, "median_y" = median_y)

  print(output)

  # plot the data using the user's chosen color, axes labels and title
  final_plot <- ggplot(data = NULL, aes(x = x, y = y)) +
    geom_point(color = color) +
    xlab(ind_var) +
    ylab(dep_var) +
    ggtitle(title) +
    theme_economist() +
    stat_smooth(method = 'lm')

  grid.arrange(arrangeGrob(scatterplot, res_plot, ncol = 2),
               arrangeGrob(histogram, qqplot, ncol = 2),
               final_plot,
               nrow = 3)

}


#' @export
#' @rdname graph_my_data
graph_my_data.data.frame <- function(data, color, ind_var, dep_var, title, x = NULL, y = NULL) {

  x <- data[, ind_var]
  y <- data[, dep_var]

  # show correlations for all variable combinations
  r_data <- cor(data)
  r_df <- data.frame("correlation" = r_data)
  message("The correlations between all combinations of variables in this data frame:")
  print(r_df)

  # plot scatterplot between x and y to check for linearity
  scatterplot <- ggplot(data, aes(x = x, y = y)) +
    geom_point() +
    ggtitle(paste("Scatter plot between", ind_var, "and", dep_var))
  message("Check: is the scatterplot linear? \n")

  # find r and interpret
  r <- cor(x, y)
  message(paste("The Pearson Linear Correlation Coefficient, r, for your data is:", r, " \n"))
  if (as.numeric(r) > 0.8) {
    message("This suggests a strong positive linear correlation! \n")
    correlation = "strong positive"
  }
  else if (as.numeric(r) > 0.4) {
    message("This suggests a moderate positive linear correlation. \n")
    correlation = "moderate positive"
  }
  else if (as.numeric(r) < -0.8) {
    message("This suggests a strong negative linear correlation! \n")
    correlation = "strong negative"
  }
  else if (as.numeric(r) < -0.4) {
    message("This suggests a moderate negative linear correlation. \n")
    correlation = "moderate negative"
  }
  else{
    message("This suggests a weak relationship. \n")
    correlation = "weak"
  }

  # regress x onto y
  mod <- lm(y ~ x)

  # find residuals for the simple linear regression model
  residuals <- resid(mod)
  # find the mean of the residuals and interpret
  m <- mean(residuals)
  if (as.numeric(m) < 0.01) {
    message("The zero mean condition holds! \n")
  }
  else{
    #stop running the function if the condition does not hold
    stop("The zero mean condition does not hold \n")
  }

  # find predicted values based on the model
  predValues <- predict(mod)
  res_data <- data.frame("predValues" = predValues, "residuals" = residuals)

  # plot the predicted values against the residuals to check for linearity and constant variance
  res_plot <- ggplot(data = res_data, aes(x = predValues, y = residuals)) +
    geom_point() +
    ggtitle("Residuals")
  message("Check: is there a non-linear trend in the residuals? Is there constant variance? \n")

  # graph histogram of residuals to check for normality
  histogram <- ggplot(data = res_data, aes(x = residuals)) +
    geom_histogram(binwidth = 10)

  # plot Q-Q Plot to check for normality
  qqplot <- ggplot(res_data, aes(sample = residuals)) +
    stat_qq()

  # remind user to check normality based on plot outputs
  message("Check: is the data relatively normal? \n")

  # find the coefficients of the model to then print the LSRL equation
  coeff <- coefficients(mod)
  intercept <- (coeff[1])
  slope <- (coeff[2])
  message(paste("The equation for your line of best fit is: Y = ", intercept, "+ ", slope, "X \n"))

  # find mean and median of bth variables
  mean_x <- mean(x)
  mean_y <- mean(y)
  median_x <- median(x)
  median_y <- median(y)

  message(paste("The mean of", ind_var, "is:", mean_x, "and the mean of", dep_var, "is:", mean_y, " \n"))
  message(paste("The median of", ind_var, "is:", median_x, "and the median of", dep_var, "is:", median_y, " \n"))

  output <- data.frame(r = r, "correlation" = correlation, "intercept" = intercept, "slope" = slope, "mean_x" = mean_x, "mean_y" = mean_y, "median_x" = median_x, "median_y" = median_y)

  print(output)

  # plot the data using the user's chosen color, axes labels and title
  final_plot <- ggplot(data = NULL, aes(x = x, y = y)) +
    geom_point(color = color) +
    xlab(ind_var) +
    ylab(dep_var) +
    ggtitle(title) +
    theme_economist() +
    stat_smooth(method = 'lm')

  grid.arrange(arrangeGrob(scatterplot, res_plot, ncol = 2),
               arrangeGrob(histogram, qqplot, ncol = 2),
               final_plot,
               nrow = 3)

}
