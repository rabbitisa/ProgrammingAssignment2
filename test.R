test = function(mat){
  ##The first run should take longer than the second run 
  ##because it actually calculates the inverse 
  ##while the second run only does a look-up from the cache.
  temp = makeCacheMatrix(mat)
  
  start.time= Sys.time()
  cacheSolve(temp)
  dur= Sys.time()- start.time
  print(dur)
  
  start.time=Sys.time()
  cacheSolve(temp)
  dur = Sys.time() - start.time
  print(dur)
}

#> set.seed(1110201)
#> r= rnorm(1000000)
#> mat1 = matrix(r,nrow=1000,ncol=1000)
#> test(mat1)
#Time difference of 1.179005 secs
#getting cached data
#Time difference of 0 secs