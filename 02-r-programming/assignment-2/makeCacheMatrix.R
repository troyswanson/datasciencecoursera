makeCacheMatrix <- function(x) {
  i <- NULL
  
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInv <- function(y) i <<- y
  getInv <- function() i
  
  list(set = set,
       setInv = setInv,
       get = get,
       getInv = getInv)
}
