cacheSolve <- function(x) {
  i <- x$getInv()
  if(is.null(i)) {
    message("Cache not available; computing...")
    m <- x$get()
    i <- solve(m)
    x$setInv(i)
  }
  i
}
