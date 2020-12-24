##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26 June 2019
# 02. Statistical Distributions
##############################################################

# Binomial Distribution
x <- rbinom(1000, size = 10, prob = 0.8)
hist(x, probability=TRUE, col='pink')

# Poisson Distribution
x <- rpois(1000, lambda=4)
hist(x, probability=TRUE, col='pink')

# Exponential Distribution
x <- rexp(1000, rate=4)
hist(x, probability=TRUE, col='pink')

# Geometric Distribution
x <- rgeom(1000, prob=0.3)
hist(x, probability=TRUE, col='pink')

# Uniform Distribution
x <- runif(1000, min=0, max=10)
hist(x, probability=TRUE, col='pink')

# Normal Distribution
x <- rnorm(1000, mean=100, sd=15)
hist(x, probability=TRUE, col='pink')
xx <- seq(min(x), max(x), length=100)
lines(xx, dnorm(xx, mean=100, sd=15), col='blue')

