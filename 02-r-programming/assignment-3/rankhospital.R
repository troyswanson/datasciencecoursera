outcome.colname <- function(outcome) {
  suffix <- switch(outcome,
                   "heart attack"  = "Heart.Attack",
                   "heart failure" = "Heart.Failure",
                   "pneumonia"     = "Pneumonia",
                   stop("invalid outcome"))
  
  paste0("Hospital.30.Day.Death..Mortality..Rates.from.", suffix)
}

rankhospital <- function(state, outcome, num = "best") {
  path <- "outcome-of-care-measures.csv"
  data <- read.csv(path, colClasses = "character")
  
  if(!is.element(state, data$State)) stop("invalid state")
  
  columns <- c("Hospital.Name", outcome.colname(outcome))
  
  obs <- data[state == data$State, columns]
  obs[, 2] <- as.numeric(obs[, 2])
  
  sorted <- obs[order(obs[2], obs[1], na.last = NA), ]
  
  if (is.character(num))
    num <- switch(num,
                  "best"  = 1,
                  "worst" = nrow(sorted))
  
  if (num > nrow(sorted)) return(NA)
  
  sorted[num, 1]
}