## These functions are used to optimize the
## computation of the inverse of a matrix by
## accepting a matrix as a parameter, calculating
## its inverse, saving the inverse in a closure
## and returning the cached value if passed the same matrix.
## A new matrix would, require calculation and would also
## replace the cached value.

## makeCacheMatrix() is a closure that acts as simple cache
## for a matrix and its inverse.  when cacheSolve()
## sends a matrix as a parameter, makeCacheMatrix() checks
## the inner closure for existing matrix-results pair that matches
## this matrix and either returns the results, if found
## or NULL if not found.
makeCacheMatrix <- function(checkMatrix = matrix()) {
  invMatrix <- NULL
  setMatrix <- function(newMatrix) {
    checkMatrix <<- newMatrix
    invMatrix <<- NULL
  }
  getMatrix <- function() checkMatrix
  setInverse <- function(InverseMatrix) invMatrix <<- InverseMatrix
  getInverse <- function() invMatrix
  list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)
}


## cacheSolve takes a matrix as a parameter and passes the matrix
## to makeCacheMatrix(). It then either displays the cached inverse
## returned by makeCacheMatrix or,if NULL is returned, calculates
## the inverse of the matrix and sends the result to makeCacheMatrix
## for caching until the next time the same matrix is to be calculated.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
