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


## cacheSolve() takes a matrix as a parameter and calls makeCacheMatrix()
## which returns either the cached result of this matrix or NULL.
## If NULL is returned, the matrix inverse is calculated and
## the result is stored in makeCacheMatrix() for retrieval the next time
## the same matrix is to be calculated.  If NULL is not returned then
## cacheSolve() uses the cached result that is returned from makeCacheMatrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
