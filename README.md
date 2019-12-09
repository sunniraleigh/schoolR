# schoolR

An R package that provides a simple and accessible approach for elementary through high school students and their educators to engage in R and solidify their understanding of mathematical concepts. 

## Installation
To install, run the following code: 
```
devtools::install_github(https://github.com/sunniraleigh/schoolR) 
```

## Getting Started
For a more detailed guide about what functions do and exmaples about how to use them, see the [vignette](./vignettes/schoolR.Rmd).

## Usage
This package should be used in a classroom setting as a supplemental material for math courses, or as part of an R group dedicated to teaching younger students.
It provides functions to help students develop a deeper understanding of how area is caclulated, and how to analyze trends in graphs.
This package also lets teachers produce practice problems, while specifying the operation, number of problems to generate, and magnitude of numbers involved. 
It will be used by teachers and students in collaboration. It will allow students to begin understanding more complex, big picture math concepts by using R without having to first learn all of the details of coding.
```
library(schoolR)
```

### Drawing squares with `square` 

### Draw a circle with `circle`

### Draw a polygon with `ngon`

### Graphing with `graph_my_data`
`graph_my_data` allows students and teachers to produce high-quality graphs of data that they obtain, or of data from `data.frame`s. It outputs basic simple linear regression diagnostics such as correlation coefficients, means, and medians, and interprets the r value. This allows for a deeper understanding of general trends in data for students who likely have very little statistical background.
```
x <- c(1, 3, 4, 6, 2)
y <- c(2, 7, 7, 11, 4)
graph_my_data(x, y, "blue", "number of students called in sick", "total number of absences", "kids out of school on a certain day")
```
![Graphs Produced](schoolR/pictures/output1.png)
![simple linear regression diagnostics](schoolR/pictures/output2.png)

### Producing Practice Problems with `generate_problems`
`generate_problems` allows educators to produce sets of practice questions for students based on what they would like them to work on. Teachers can specify the upper and lower bounds of the numbers being chosen from to use in the equation, what operation to use, and how many problems to produce.
```
generate_problems("multiply", 5, 15, 10)
```

## Authors
Natalia Iannucci, Isabel Gomez, Sunni Raleigh
