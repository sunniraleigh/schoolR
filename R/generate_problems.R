#' generates a table of practice problems for students
#' @param type a string; must be multiple, divide, add, or subtract
#' @param lower lower bound for generating random numbers; default value of 1
#' @param upper upper bound for generating random numbers
#' @param repeats number of problems to be generated; default is one
#' @export
generate_problems <- function(type, lower = 1, upper, repeats = 1){
  first_num <- sample(lower:upper, repeats)
  second_num <- sample(lower:upper, repeats)
  if (type == "multiply") {
    output <- data.frame("Problem" = paste(first_num, "*", second_num), "Student Answer" = " ", "Correct Answer" = first_num * second_num)
    print(output)
  }
  else if (type == "divide") {
    output <- data.frame("Problem" = paste(first_num, "/", second_num), "Student Answer" = " ", "Correct Answer" = first_num / second_num)
    print(output)
  }
  else if (type == "add") {
    output <- data.frame("Problem" = paste(first_num, "+", second_num), "Student Answer" = " ", "Correct Answer" = first_num + second_num)
    print(output)
  }
  else if (type == "subtract") {
    output <- data.frame("Problem" = paste(first_num, "-", second_num), "Student Answer" = " ", "Correct Answer" = first_num - second_num)
    print(output)
  }
}

