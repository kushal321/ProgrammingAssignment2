## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
 m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
## get function returns the given input matrix        
  setmatrix <- function() m <<-solve(x)
## setmatrix function stores the result of inverse of matrix computed via         
  getmatrix <- function() m
## getmatrix function return the value of m which is inverse of orignal matrix        
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
## the object attached to matrix is passed as a arguement        
   m <- x$getmatrix()
## check if there is a inversed matrix for this object         
     if(!is.null(m)) {
## return the already created inverse matrix via this object             
       message("getting cached data")
       return(m)
      }
  data <- x$get()
##if the object is not used yet for inversing matrix
##then calculate the inverse of matrix for that object        
  m <- solve(data, ...)
##set the inverse of matrix for this object so that it can be retrived via cache later        
  x$setmatrix(m)
  m
## Return a matrix that is the inverse of 'x'
}

##OUTPUT
## > z<-makeCacheMatrix()
## > z creates a empty matrix 
## > create a matrix
## > l<-matrix(c(4,2,6,7),nrow = 2,ncol = 2)
## > l
##      [,1] [,2]
##[1,]    4    6
##[2,]    2    7
## Now set the matrix to l for z object
## > z$set(l)
## now set the inverse of the matrix to z object by calling
## > z$setmatrix()
## retrive the value of object to see wether a inverse is created and attached to object or not
## > z$getmatrix()
##         [,1]   [,2]
## [1,]  0.4375 -0.375
## [2,] -0.1250  0.250
## now this function checks wether the object has already been computed or not
## getting cached data
## > cacheSolve(z)
## getting cached data
##        [,1]   [,2]
## [1,]  0.4375 -0.375
## [2,] -0.1250  0.250
## this finds that there exists inverse for the object z already so it gets the value of matrix via getmatrix function of that object.
##otherwise it set the matrix and then return it
