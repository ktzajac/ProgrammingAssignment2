# Caching the Inverse of a Matrix

## Below are two functions that are used to create a special object that stores a matrix and cache's its inverse. 
## The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to:
## 1.set the value of the matrix
## 2.get the value of the matrix
## 3.set the value of the matrix inverse
## 4.get the value of the matrix inverse

makeCacheMatrix <- function(A = matrix()) { 
  AI <- NULL
  set <- function(B) {
    A <<- B
    AI <<- NULL
  }
  get <- function() A
  setSolve <- function(solve) AI <<- solve
  getSolve <- function() AI
  list(set = set, get = get,
       setSolve = setSolve,
       getSolve = getSolve)
  
} 

## The following function computes the inverse of the special "matrix" created with the above function. 
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the data and sets the value of the AI in the cache via the setSolve function.

cacheSolve <- function(x, ...) { 
  AI <- x$getSolve()
  if(!is.null(AI)) {
    message("getting cached data")
    return(AI)
  }
  data <- x$get()
  
  AI <- solve(data, diag(dim(data)[[1]]))
  
  x$setSolve(AI)
  
  ## Return a matrix that is the inverse of 'x' 
  AI
} 
