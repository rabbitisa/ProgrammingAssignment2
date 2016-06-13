## Put comments here that give an overall description of what your
## functions do


## The first function, makeCacheMatrix creates a special matrix, 
## which is really a list containing a function to
## 1. Set the value of the matrix
## 2. Get the value of the matrix
## 3. Set the value of the inverse
## 4. Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function (y){
    x <<- y
    m <<- NULL
  }
get <- function()x
setinverse <- function(solve) m <<- solve
getinverse <- function() m
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Calculate the inverse
## first checks to see if the inverse has been calculated
## if so gets the inverse from cache and skips computation
## otherwise calculates the inverse and sets the value in the cache
## this function is tested by the test.R file
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if (!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data,...)
  x$setinverse(m)
  m
}

#test = function(mat){
  ##The first run should take longer than the second run 
  ##because it actually calculates the inverse 
  ##while the second run only does a look-up from the cache.
 # temp = makeCacheMatrix(mat)
  
  #start.time= Sys.time()
  #cacheSolve(temp)
  #dur= Sys.time()- start.time
  #print(dur)
  
  #start.time=Sys.time()
  #cacheSolve(temp)
  #dur = Sys.time() - start.time
  #print(dur)
#}

#> set.seed(1110201)
#> r= rnorm(1000000)
#> mat1 = matrix(r,nrow=1000,ncol=1000)
#> test(mat1)
#Time difference of 1.179005 secs
#getting cached data
#Time difference of 0 secs
