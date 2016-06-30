# Loop functions
#
# R has some inbuilt loop commands:
# lapply
# sapply
# apply
# tapply
# mapply
#
# lapply always return a list, regardless of the clas of input. Suppose you have a list of
# objects and you want to apply a function to each of them. lapply does that for you
x <- list(a =1:5, b = rnorm(10))
lapply(x,mean)
#$a
#[1] 3
#
#$b
#[1] 0.1320853
#
x <- 1:4
lapply(x,runif)
lapply(x,runif, min = 0, max = 10)
# runif random uniforms
x <- list(a = matrix(1:4,2,2),b = matrix(1:6,3,2))
lapply(x,function(elt) elt[,1]) # extract the first column of matrix
lapply(x,function(elt) elt[1,]) # extrac first row
# elt is an anonimous function, i.e., is a function defined inside lapply
# 
x <- list(a = 1:4,b = rnorm(10),c = rnorm(20,1), d = rnorm(100,5))
lapply(x,mean) # gives back a list
sapply(x,mean) # gives back a vector, which makes more sense if we know the 
               # means are just numbers
#         a          b          c          d 
# 2.5000000 -0.8182525  0.7816897  5.0877992 
#
# Note that we are using these loop functions because it is not possible to 
# apply the mean function to a list. We have an error message
mean(x)
#[1] NA
#Warning message:
#In mean.default(x) : argument is not numeric or logical: returning NA
#
str(apply)
# function (X, MARGIN, FUN, ...)  
# X is an array
# MARGIN e.g, for a matrix, 1 indicates rows, 
# 2 indicates columns, c(1,2) indicates rows and columns
x <- matrix(rnorm(200),20,10)
apply(x,2,mean) # applies the mean over the columns
apply(x,1,mean) # applies the mean over the rows
#
apply(x,1,sum)
# Shortcuts:
rowSums = apply(x,1,sum)
rowMeans = apply(x,1,mean)
colSums = apply(x,2,sum)
colMeans = apply(x,2,mean)
#
x <- matrix(rnorm(200),20,10)
apply(x, 1, quantile, probs = c(0.25,0.75)) 
# this calculates the 25th and 75th percentiles for each rows
a <- array(rnorm(2*2*10),c(2,2,10))
apply(a,c(1,2),mean)
#[,1]       [,2]
#[1,] 0.4531515 -0.3013522
#[2,] 0.2338143 -0.3210539
apply(a,c(2,1),mean)
#[,1]       [,2]
#[1,]  0.4531515  0.2338143
#[2,] -0.3013522 -0.3210539
#
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
# same as:
mapply(rep,1:4,4:1)
# rep requires 2 arguments
# mapply takes the function rep and as argument
# one element from one list and one element form the other list
noise <- function(n,mean,sd){
    rnorm(n,mean,sd)
}
noise(5,1,2)
#[1]  1.5849355  0.2366525  0.2426052 -1.6621779 -2.4208290
mapply(noise,1:5,1:5,1:5) # instantly vectorize
#
x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10)
tapply(x,f,mean)
#1         2         3 
#0.1604122 0.4122704 1.0917529 
mean(x[1:10])
#[1] 0.1604122
#
tapply(x,f,mean)
#
x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10)
split(x,f) # splits the original data into 3 groups of 10 elements each
# splits always returns a list back
lapply(split(x,f),mean)
# does the same as
tapply(x,f,mean)
#
library(datasets)
head(airquality)
s <- split(airquality,airquality$Month)
lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
#
sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm = TRUE))
# splitting on more than one level
x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)
interaction(f1,f2)
str(split(list(f1,f2)))
str(split(list(f1,f2),drop = TRUE))
#
# Debugging tools
#
printmessage <- function(x){
    if (x > 0)
        print("x is greater than zero")
    else
        print("x is less than or equal to zero")
    invisible(x)
}
x = 5
printmessage(5)
#
printmessage2 <- function(x){
    if(is.na(x))
        print("missing value!")
   else if (x > 0)
        print("x is greater than zero")
    else
        print("x is less than or equal to zero")
    invisible(x)
}
# 
traceback()
debug()
browser()
trace()
recover()
#
# examples
# Error in mean(aaa) : object 'aaa' not found
traceback() # gives the most recent error
# 1: mean(aaa)
debug() # you can debug any function and it'll give you back
        # exactly where the error is
####
# ctrl l to clear the Consol history
# rm(list=ls()) # clear the workspace
###

