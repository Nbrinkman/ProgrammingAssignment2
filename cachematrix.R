## These functions cache the inverse of a matrix


## This first function creates an object that stores a matrix and caches its inverse.

makeCacheMatrix <- function(m = matrix()) {
 i <- NULL
 set <- function(matrix){
   m <<- matrix
   i <<- NULL
 }
 get <- function(){
   m
 }
 set_inverse <- function(inverse){
   i <<- inverse
 }
 get_inverse <- function(){
   i
 }
 list(set=set, get=get, set_inverse=set_inverse, get_inverse=get_inverse)
}


## This second funtion calculates the inverse of the matrix created above. 
## It looks for the cached inverse.  If stored, it skips the computation and returns the cached value.
cacheSolve <- function(x, ...) {
 m <- x$get_inverse()
 if (!is.null(m)){
   message("getting cached data")
   return (m)
 }
 data <- x$get()
 m <- solve(data)
 x$set_inverse(m)
 m
}
