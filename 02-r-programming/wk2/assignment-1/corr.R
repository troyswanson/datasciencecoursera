corr <- function(directory, threshold = 0) {
  l <- list()
  for(i in list.files(directory)) {
    path <- sprintf("%s/%s", directory, i)
    data <- read.csv(path)
    obs <- data[complete.cases(data), ]
    if(nrow(obs) > threshold) {
      l[[i]] <- obs
    }
  }
  x <- numeric()
  for(i in l) {
    x <- append(x, cor(i$sulfate, i$nitrate))
  }
  x
}