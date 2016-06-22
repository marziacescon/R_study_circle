## Beginner R - lesson 2
##
if (x<3){y<-10}else{y<-0}
#
for(i in 1:10) {
  print(x(i))
}
#
count <- 0
while(count<10){
  print(count)
  count <- count+1
}
#
# repeat initiates an infinite loop. The only way to exit a repeat loop is to call break.
#
for (i in 1:100){
  if (i<=20){
    next
    #skip the first 20 iterations
  }
  # do something here
}
#
add2 <- function(x,y){
  x+y
}

above10 <- function(x){
  use <- x>10
  x[use]
}

above <- function(x,n){
  use <- x>n
  x[use]
}

columnmean <- function(y,removeNA = TRUE){
  # calculate the mean o fthe column
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(y[, i], na.rm = removedNA)
  }
  means
}
#
#
# Functions
# 
# Functions are created using the function() directive and are stored as R obejcts 
# they are R objects of the class "function"
#
#f <- function(<arguments>){
#  do something interesting
#}
# functions can be passed as arguments to other functions
# functions can be nested
# Note: the return value is the last one 
# R functions arguments can be matched positionally or by name
mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata,na.rm = FALSE)
#[1] 0.9485699
sd(na.rm = FALSE, x = mydata)
#[1] 0.9485699
sd(na.rm = FALSE, mydata)
#[1] 0.9485699
# it's legal but don't reverse the order of the argument 
#
# defining a function
f <- function(a, b = 1, c = 2, d = NULL){
  
}
# 
# Lazy evaluation: arguments to functions are evaluated only as needed
f <- function(a,b){
  a^2
}
f(2)
#[1] 4
# This function actually never uses the argument b, so calling
# f(2) will not produce an error because the 2 gets positionally matched to a
#
f <- function(a,b){
  print(a)
  print(b)
}
f(45)
#[1] 45
#Error in print(b) : argument "b" is missing, with no default
# 
# ... is often used when extending another function and you don't want to copy
# the entire argument list of the original function
myplot <- function(x,y,type = "l",...){
  plot(x,y,type = type, ...)
}
#
# The ... argument is necessary when the number of arguments passed to the funcitons
# cannot be known in advance
# Any argument tha appear after the ... on the argumetn list must be named
# explicitly and in full and cannot be partially matched
#
f <- function(x,y){
  x^2+y/z
}
# This function has 2 formal arguments: x and y. In the body of the function there is 
# another symbol: z, called free variable. Free variables are not formal arguments
# and are not local variables. So how does R assign a value to z? With the scoping rules
# Lexical scoping: the value of free values are searched for in the environment in which 
# the function was defined, then the search is continued in the parent environment
# Why all this matter? Typically, a function is defined in the global environment, so
# that the values of the free variables are just found in the user's workspace. 
# However, in R you can have functions defined inside other functions. In this case
# the environment in which a function is defined is the body of another function!
#
make.power <- function(n){ 
  pow <- function(x){
    x^n
  }
  pow
}
# make.power is a function that returns another function as its value
cube <- make.power(3)
square <- make.power(2)
#
ls(environment(cube))
# [1] "n"   "pow"
get("n",environment(cube))
# [1] 3
ls(environment(square))
# [1] "n"   "pow"
get("n",environment(square))
# [1] 2
# 
# Lexical vs. Dynamic scoping
y <-10
f <- function(x){
  y <- 2
  y^2+g(x)
}
#
g <- function(x){
  x*y
}
f(3)
# [1] 34 because R uses lexical scoping, i.e., the value of y in the function g() gets
# searched in the global environment y = 10
# Python uses lexical scoping as well
# 
# Dates and times in R
# R has developed a special representation of dates and times
# Dates --> Date class
# Tmes --> POSIXct or POSIXlt class
# Dates are stored internally as the number of days since 1970-01-01
# Times are stored internally as the number of seconds since 1970-01-01
#
x <- as.Date("1970-01-01") #dates are coerced from character string
unclass(as.Date("1970-01-02"))
# [1] 1 because underlying R is storing dates from 1970-01-01
x <- Sys.time()
#[1] "2016-06-21 12:40:13 AEST"
p <- as.POSIXlt(x)
names(unclass(p))
#[1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"  
#[8] "yday"   "isdst"  "zone"   "gmtoff"
# p$sec
# [1] 13.87791
#
# strptime() 
# Operations on dates are possible (+->) and they keep track of leap years, 
# daylight savings and time zones
#