outcome.colname <- function(outcome) {
  suffix <- switch(outcome,
                   "heart attack"  = "Heart.Attack",
                   "heart failure" = "Heart.Failure",
                   "pneumonia"     = "Pneumonia",
                   stop("invalid outcome"))
  
  paste0("Hospital.30.Day.Death..Mortality..Rates.from.", suffix)
}

best <- function(state, outcome) {
  path <- "outcome-of-care-measures.csv"
  data <- read.csv(path, colClasses = "character")
  
  if (!is.element(state, data$State)) stop("invalid state")
  
  columns <- c("Hospital.Name", outcome.colname(outcome))
  
  obs <- data[state == data$State, columns]
  obs[, 2] <- as.numeric(obs[, 2])
  
  sorted <- obs[order(obs[2], obs[1]), ]
  sorted[1, 1]
}