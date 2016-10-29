## These functions are used to optimize the computation of the inverse of a matrix by
## accepting a matrix as a parameter, calculating its inverse, saving the inverse in a closure
## and returning the cached value if passed the same matrix.
## A new matrix would, require calculation and would also set the cached value of the matrix.


## makeCacheMatrix() is a matrix object with an inner closure that acts as simple cache
## for the matrix and its inverse.
makeCacheMatrix <- function(checkMatrix = matrix()) {
    #instantiate object with checkMatrix parameter.
    invMatrix <- NULL
    setMatrix <- function(newMatrix) {
        checkMatrix <<- newMatrix
        invMatrix <<- NULL
    }
    #function to check if matrix has been solved and result cached.
    getMatrix <- function() checkMatrix

    #function to store the inverse of the matrix.
    setInverse <- function(InverseMatrix) invMatrix <<- InverseMatrix

    #function to retrieve the cached inverse of the matrix.
    getInverse <- function() invMatrix

    #expose the getters and setters
    list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)
}


## cacheSolve() takes the matrix object makeCacheMatrix() and checks for the cached inverse of the matrix.
## Then either the cached version is returned or it calulates the inverse matrix and stores the result in
## the cache.

cacheSolve <- function(m, ...) {
    #check for a cached result for this matrix
    cachedVal <- m$getInverse()

    #if a non-nul value is returned from the cache then use it.
    if (!is.null(cachedVal)) {
        message("using cached data")
        return(cachedVal)
    }
    #if NULL is returned then calculate and store the inverse of the matrix.
    matrix_data <- m$getMatrix()
    matrix_inverse <- solve(matrix_data, ...)
    m$setInverse(matrix_inverse)
    return(matrix_inverse)
}
