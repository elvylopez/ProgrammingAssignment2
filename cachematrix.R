## The function "cachematrix" is being created to create a "matrix" object that can cache its inverse

## The second function "cachesolve" will compute the inverse of the "matrix" returned by the first "cachematrix" function. If the inverse has been caluclated and the 

## matrix has not changed then the second function "cachesolve" will retrieve the inverse from the cache 


## The "cachematrix" function creates a "matrix" object that can cache its own inverse.
makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y){
	x <<- y
	inv <<- NULL 

}
	get <- function() x
	setinverse <- function(inverse) inv <<- inverse
	getinverse <- function() inv
	list(set = set, get = get, 
	setinverse = setinverse, 
	getinverse = getinverse)
}



## This function will compute the inverse of the first function "cachematrix". If the inverse has 
## been calculated then this function will retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inv <- x$getinverse()
	if(!is.null(inv)) {
	message("Getting Cached Data")
	return(inv)
}
	data <- x$get()
	inv <- solve(data, ...)
	x$setinverse(inv)
	inv
}
