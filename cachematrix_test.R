## create a random matrix 'A'
A <- matrix(rnorm(25),5)
A

## name rows and columns of the matrix 'A' 
dimnames(A) <- list(c("a", "b", "c", "d", "e"), c( "f", "g", "h", "i", "j"))
A

## cache matrix 'A'
a <- makeCacheMatrix(A)

## compute inverse of matrix 'A'
B <- cacheSolve(a)
B

## check if 'A' matrix inverse is cached
cacheSolve(a)

## check if matrix 'A' multiplied by inverse of 'A' gives the idenity matrix
## check the idenity matrix row and column names
C <- A%*%B
C
## do the multiplication result rounding for easier check
D <- round(C,digits = 10)
D
sum(colSums(D == diag(5))) == 25
## check if inverse of matrix 'A' multiplied by 'A' gives the idenity matrix
## check the idenity matrix row and column names
E <- B%*%A
E
## do the multiplication result rounding for easier check
F <- round(E,digits = 10)
F
sum(colSums(F == diag(5))) == 25
