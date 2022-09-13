## Put comments here that give an overall description of what your
 ## functions do
 
-## Write a short comment describing this function
+## The set function takes the matrix 
+## The setinv function calculates the inverse of the matrix
+## The get function returns the matrix
+## The getinv function returns the inverse of the matrix
 
-makeCacheMatrix <- function(x = matrix()) {
 
+
+
+
+makeCacheMatrix <- function(x = numeric()) {
+  
+  m <- NULL
+  
+  set <- function(y) {
+    
+    x <<- y
+    
+    m <<- NULL
+    
+  }
+  
+  get <- function() x
+  
+  setinv <- function(solve) m <<- solve
+  
+  getinv <- function() m
+  
+  list(set = set, get = get,
+       
+       setinv = setinv,
+       
+       getinv = getinv)
+  
 }
 
 
-## Write a short comment describing this function
+# The function checks if the inverse of the matrix ist already calculated,
+## if not it calculates it calculates it and returns the matrix
+## if the inverse of the matrix ist already calculatesd ist indeicates that and returns the saved matix
+
 
 cacheSolve <- function(x, ...) {
-        ## Return a matrix that is the inverse of 'x'
+  
+  m <- x$getinv()
+  
+  if(!is.null(m)) {
+    
+    message("getting cached data")
+    
+    return(m)
+    
+  }
+  
+  data <- x$get()
+  
+  m <- solve(data, ...)
+  
+  x$setinv(m)
+  
+  m
+  
 }
+
+
+### Code to test the functions
+vex=cbind(c(1,5,3,5),c(1,2,3,5),c(41,42,33,53),c(31,52,73,85))
+
+
+
+xy<-makeCacheMatrix(vex)
+
+xy$get()
+
+xy$getinv()
+
+
+
+cacheSolve(xy)
+
+
+
+xy$set(vex)
+
