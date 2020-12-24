##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26June2019
# 13. K-Means Clustering
##############################################################

# Load and explore the dataset
attach(iris)
help(iris)
dim(iris)
str(iris)
plot(Sepal.Length, Petal.Length, pch = 19, 
     main = "Iris", xlab = "Sepal Length", ylab = "Petal Length")

# Creating dataset for cluster analysis
irisData <- iris 
irisData$Species <- NULL 
str(irisData)
summary(irisData)

# K-Means Model
kfit <- kmeans(irisData, 3, nstart = 20) 
kfit
plot(Sepal.Length, Petal.Length, pch = 19, 
     col = as.numeric(kfit$cluster),
     main = "Iris", xlab = "Sepal Length", ylab = "Petal Length")

# Confusion Matrix
kfit$cluster <- as.factor(kfit$cluster)
(t <- table(iris$Species,kfit$cluster))  
plot(t, col = 1:3)

# Let's Animate it
# install.packages("animation")
library(animation)
ani <- iris[,c(1,3)]
kmeans.ani(ani,centers=3)

# Further Learning
# 1. Elbow plot to find optimum K value.
# 2. Accuracy Measures
# 3. K-Medoids to include Qualitative data with different distance measures.
