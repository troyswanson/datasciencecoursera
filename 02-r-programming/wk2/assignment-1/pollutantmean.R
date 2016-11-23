pollutantmean <- function(directory, pollutant, id = 1:332) {
  x <- numeric()
  for(i in id) {
    path <- sprintf("%s/%03d.csv", directory, i)
    data <- read.csv(path)
    x <- append(x, data[[pollutant]])
  }
  mean(x, na.rm = TRUE)
}