outcome.colname <- function(outcome) {
  suffix <- switch(outcome,
                   "heart attack"  = "Heart.Attack",
                   "heart failure" = "Heart.Failure",
                   "pneumonia"     = "Pneumonia",
                   stop("invalid outcome"))
  
  paste0("Hospital.30.Day.Death..Mortality..Rates.from.", suffix)
}

rankstate <- function(x, num) {
  sorted <- x[order(x[2], x[1], na.last = NA), ]
  
  if (is.character(num))
    num <- switch(num,
                  "best"  = 1,
                  "worst" = nrow(sorted))
  
  if (num > nrow(sorted)) return(NA)
  
  sorted[num, 1]
}

rankall <- function(outcome, num = "best") {
  path <- "outcome-of-care-measures.csv"
  data <- read.csv(path, colClasses = "character")
  
  columns <- c("Hospital.Name", outcome.colname(outcome), "State")
  
  obs <- data[, columns]
  obs[, 2] <- as.numeric(obs[, 2])
  
  split <- split(obs, obs$State)
  
  result <- sapply(split, rankstate, num = num)
  
  data.frame(hospital = result, state = names(result))
}