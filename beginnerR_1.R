## Beginner R - lesson 1
##
getwd() # return your working directory
#
x <- 1 # assignment
#
msg <- "hello!"
print(msg)
#
x <- 5 # x is assigned to 5
#
x <- 1:20 #sequence
#
1 # numeric object
#   [1] 1
1L # explicitly gives an integer number
#   [1] 1
#
c <- c(0.5,0.6) # c means concatenate
#
c <- c(T,F) # concatenate the logicals "true", "false"
#
x <- vector("numeric",length=10) # creates a vector of 10 numeric elements (0 by default)
# coercion by default happens behind the scene:
y <- c(1.7,"a")
#> y
#[1] "1.7" "a"
y <-c (TRUE,"a")
#> y
#[1] "TRUE" "a"   
y <-c (TRUE,2)
#> y
#[1] 1 2
# we can also explicitly coerce a follows:
x <- 0:6
class(x) # output the class
# [1] "integer"
as.numeric(x) #coerce to numeric
#[1] 0 1 2 3 4 5 6
as.logical(x) # coerce x to logical
#[1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
as.character(x) 
#[1] "0" "1" "2" "3" "4" "5" "6"
#
# lists are a special type of vector that can contain elements of different classes
x <- list(1,"a",TRUE,1+4i)
#> x
#[[1]]
#[1] 1
#
#[[2]]
#[1] "a"
#
#[[3]]
#[1] TRUE
#
#[[4]]
#[1] 1+4i
#
# elements of a list will have double brackets
#
m <- matrix(nrow = 2,ncol = 3)
dim(m)
# matrices are constructed columnwise
m <- matrix(1:6,nrow = 2, ncol = 3)
# alternative way to construct matrices
m <- 1:10
dim(m) <- c(2,5)
#
x <- 1:3
y <- 10:12
cbind(x,y) # bind by column
rbind(x,y) # bind by row
#
m[1,3] #access element in position (1,3) of the matrix
m[1,3] <- 11 # assign value 11 to the element in position (1,3) in the matrix
#
# factor is a data type. One can think of a factor as an integer vector where each integer has a label
# factors are created with the factor function. 
x <- factor(c("yes","yes","no","yes","no"))
unclass(x)
x <- factor(c("yes","yes","no","yes","no"),levels = c("yes","no"))
#
x <- c(1,2,NA,10,3) # [1]  1  2 NA 10  3
is.na(x) # [1] FALSE FALSE  TRUE FALSE FALSE
x <- c(1,2,NaN,10,3)
is.nan(x)
# data frame : key data type in R used to store tabular data
# data frames are usually vreated by calling read.table() or read.csv()
# can be converted to a matrix: data.matrix()
x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
#foo   bar
#1   1  TRUE
#2   2  TRUE
#3   3 FALSE
#4   4 FALSE
nrow(x)
ncol(x)
names(x) <- c("foo","bar")
m <- matrix(1:4,nrow=2,ncol=2)
dimnames(m) <- list(c("a","b"),c("c","d"))
#
x <- list(a=1,b=2,c=3)
#
y <- data.frame(a=1,b="a")
# Read Data
# read.table, read.csv for reading tabular data
# readLines for reading line of a text
# source for reading in R code files
# dget for reading in R code files
# load for reading in saved workspaces
# unserialize for reading binary objects
# the corresponding functions to write data are:
# write.table
# writeLines
# dump
# dput
# serialize
y <-data.frame(a=1,b ="a")
dput(y)
dput(y,file = "y.R")
new.y <- dget("y.R")
# dump can be used to multiple R object
x <- "foo"
y <-data.frame(a=1, b="a")
dump(c("x","y"), file = "data.R")
rm(x,y) # remove the objects from the workspace
source("data.R")
# interfaces to the outside world
# file
# gzfile, bzfile
# url
con <- url("urlname","r") #opens connection for reading 
x <- readLines(con,10)
close(con)
#
x <- c("a","b","c","d","a")
x[1]
x[2]
x[1:4] #numeric index
x[x>"a"] #logical index
u <- x>"a"
x[u]
# [[]] for single elements
# $ for one element of a list
x <- list(foo =1:4, bar = 0.6, baz = "hello")
x[1] # single bracket 
# $foo
# [1] 1 2 3 4
x[[1]]
# [1] 1 2 3 4
x$foo
# [1] 1 2 3 4
x[c[1:4]]
x <- matrix(1:6,2,3)
x[1,2]
#[1] 3
x[2,1]
x[1,2,drop=FALSE] # preserve the dimension
x[1,]
# [1] 1 3 5
x[1,,drop=FALSE]
#[,1] [,2] [,3]
#[1,]    1    3    5
x <-c(1,2,NA,4,NA,5)
bad <- is.na(x) 
x[!bad]
y <-c("a","b",NA,"d",NA,"f")
good = complete.cases(x,y)#
# [1]  TRUE  TRUE FALSE  TRUE FALSE  TRUE
x[good]
#[1] 1 2 4 5
y[good]
#[1] "a" "b" "d" "f"
#
# * is elementwise multiplication
# %*% is matrix multiplication
#


x$bar

