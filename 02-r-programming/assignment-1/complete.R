complete <- function(directory, id = 1:332) {
  nobs <- numeric()
  for(i in id) {
    path <- sprintf("%s/%03d.csv", directory, i)
    data <- read.csv(path)
    obs <- data[complete.cases(data), ]
    nobs <- append(nobs, nrow(obs))
  }
  data.frame(id, nobs)
}