#
str(lm)
#function (formula, data, subset, weights, na.action, method = "qr", model = TRUE, 
#          x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE, contrasts = NULL, 
#          offset, ...)
#
x <- rnorm(100,2,4)
summary(x)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -8.5960  0.4261  2.4180  2.3440  4.6120 11.1500 
str(x)
# num [1:100] 0.415 2.492 6.342 -6.99 3.197 ...
f <- gl(40,10)
str(f)
summary(f)
#
library(datasets)
head(airquality)
str(airquality)
summary(airquality)
#
m <- matrix(rnorm(100),10,10)
str(m)
#
s <- split(airquality, airquality$Month)
str(s)
summary(s)
#
# Functions for probability distributions in R
#
# Probability distribution functions usually have the following functions
# associated with them:
#
d # density
r # randon number generation
p # cumulative distribution
q # quantile function
# Example: for the gamma distribution there will be a dgamma,pgamma,rgamma,qgamma
# For the standard normal distribution
dnorm
rnorm
qnorm
dnorm
#
x <- rnorm(10)
x <- rnorm(10,20,2)
set.seed(1)
rnorm(5)
#
rpois(10,1)
ppois(2,2) # cumulative distribution
#
# 
set.seed(20)
x <- rnorm(100)
e <- rnorm(100,0,2)
y <- 0.5 + 2*x +e
summary(y)
plot(x,y)
#
set.seed(10)
x <- rbinom(100,1,0.5)
e <- rnorm(100,0,2)
y <- 0.5 + 2*x +e
summary(y)
plot(x,y)
#
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(x)
plot(x,y)
#
set.seed(1)
sample(1:10,4)
#[1] 3 4 5 7
sample(letters,5)
# [1] "f" "w" "y" "p" "n"
sample(1:10) ##permutation
sample(1:10,replace = TRUE) ## sample with replacement
#
# Profiler: if something is taking a very long time, this tool helps
# time your functions
#
system.time() # gives the time that was needed to execute the expression
# examples
## elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))
# user  system elapsed 
# 0.014   0.011   2.594
##
hilbert <- function(n){
    i <- 1:n
    1/outer(i-1,i,"+")
}
x <- hilbert(1000)
system.time(svd(x))
# user  system elapsed 
# 5.696   0.016   5.743 
system.time(
    {n <- 1000
    r <- numeric(n)
    for (i in 1:n){
        x <- rnorm(n)
        r[i] <- mean(x)
    }
    }
)
# evaluates the time of the whole expression in curly braces
Rprof() #keeps track of teh function call stack at regularly sampled
        # intervals and tabulates how much time is spent in each function
summaryRprof()
