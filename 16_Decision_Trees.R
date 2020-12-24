##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26June2019
# 16. Decision Trees
##############################################################

# Decision Tree: Regression
# Load the dataset
advData <- read.csv("Advertising.csv", header = TRUE)

# Basic exploration
dim(advData)
names(advData)
str(advData)
head(advData)
summary(advData)

# install.packages('rpart')
library(rpart)
# install.packages('rpart.plot')
library(rpart.plot)

regTreeFit <- rpart(Sales~., data = advData)
plot(regTreeFit)
text(regTreeFit)
prp(regTreeFit)
summary(regTreeFit)

# Decision Tree: Classification
clasTreeFit <- rpart(Species~., data = iris, minbucket = .05)
prp(clasTreeFit)
summary(clasTreeFit)

# Variable Importance at a Glance
# install.packages("Boruta")
library("Boruta")
borutaFit <- Boruta(Sales ~ ., data = advData)          
getSelectedAttributes(borutaFit)              
attStats(borutaFit)                           
borutaFit                                     

# Further Learning
# 1. Tree Pruning
# 2. Bagging and Random Forest
