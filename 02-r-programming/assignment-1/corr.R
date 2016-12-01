corr <- function(directory, threshold = 0) {
  x <- numeric()
  for(i in list.files(directory)) {
    path <- sprintf("%s/%s", directory, i)
    data <- read.csv(path)
    obs <- data[complete.cases(data), ]
    if(nrow(obs) > threshold) {
      x <- append(x, cor(obs$sulfate, obs$nitrate))
    }
  }
  x
}
