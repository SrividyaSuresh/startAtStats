##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26June2019
# 11. Linear Regression 
##############################################################

# Load the dataset
advData <- read.csv("Advertising.csv", header = TRUE)

# Basic exploration
dim(advData)
names(advData)
str(advData)
head(advData)
summary(advData)

# Exploring Sales
boxplot(advData$Sales, horizontal=TRUE, 
        col = "lightblue", main = "Boxplot of Sales")
hist(advData$Sales, prob = TRUE, 
     col = "lightblue", main = "Histogram of Sales")
lines(density(advData$Sales), col = "red", lwd = 3)

# Exploring each Feature
boxplot(advData$TV, advData$Radio, advData$Newspaper, horizontal=TRUE, 
        col = "lightblue", main = "Boxplot")

# Sales vs TV Advertisement
plot(advData$TV, advData$Sales, pch = 19, col = "red",
     main = "TV vs Sales", xlab = "TV Advertisement", ylab = "Sales")

# Sales vs Radio Advertisement
plot(advData$Radio, advData$Sales, pch = 19, col = "red",
      main = "Radio vs Sales", xlab = "Radio Advertisement", ylab = "Sales")
     
# Sales vs Newspaper Advertisement
plot(advData$Newspaper, advData$Sales, pch = 19, col = "red",
     main = "Newspaper vs Sales", xlab = "Newspaper Advertisement", ylab = "Sales")
     
# Pairwise Plots
pairs(advData, pch = 19, col = "red")

# Correlation Plots
# install.packages("corrplot")
library(corrplot)
corrplot.mixed(cor(advData))

# Simple linear regression

# Sales vs TV Advertisement
plot(advData$TV, advData$Sales, pch = 19, col = "blue",
     main = "TV vs Sales", xlab = "TV Advertisement", ylab = "Sales")
model1 <- lm(Sales ~ TV, data = advData)
summary(model1)
model1$coefficients
abline(model1$coefficients, col="black", lwd=3) 

# Sales vs Radio Advertisement
plot(advData$Radio, advData$Sales, pch = 19, col = "blue",
     main = "Radio vs Sales", xlab = "Radio Advertisement", ylab = "Sales")
model2 <- lm(Sales ~ Radio, data = advData)
summary(model2)
model2$coefficients                                   
abline(model2$coefficients, col="black", lwd=3)      

# Sales vs Newspaper Advertisement
plot(advData$Newspaper, advData$Sales, pch = 19, col = "blue",
     main = "Newspaper vs Sales", xlab = "Newspaper Advertisement", ylab = "Sales")
model3 <- lm(Sales ~ Newspaper, data = advData)
summary(model3)
model3$coefficients                                   
abline(model3$coefficients, col="black", lwd=3)    

# Multiple Linear Regression

# Sales vs TV and Radio Advertisement
# install.packages("scatterplot3d")
library(scatterplot3d)
scatterplot3d(advData$TV, advData$Radio, advData$Sales, angle = 45,
              pch = 19, highlight.3d = T, box = T,
              xlab = "TV", ylab = "Radio", zlab = "Sales")

lmFit1 <- lm(Sales ~ TV + Radio, data = advData)
summary(lmFit1)
lmFit1$coefficients
plot3d$plane3d(lmFit1$coefficients)

# Multiple linear regression with all features
lmFit2 <- lm(Sales ~ TV + Radio + Newspaper, data = advData)
summary(lmFit2)
vif(lmFit2)
plot(lmFit2)
