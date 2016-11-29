makeCacheMatrix <- function(x) {
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInv <- function(y) i <<- y
  getInv <- function() i
  
  set(x)
  
  list(set = set,
       setInv = setInv,
       get = get,
       getInv = getInv)
}
