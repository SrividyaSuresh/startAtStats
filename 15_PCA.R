##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26June2019
# 15. Principle Component Analysis
##############################################################

# Explore the dataset
help(iris)
dim(iris)
str(iris)
summary(iris)
attach(iris)

# Visualisation
irisData <- iris 
irisData$Species <- NULL 
pairs(irisData, pch = 19, col = as.numeric(iris$Species))
plot(Sepal.Length, Petal.Length, pch = 19, 
     col = as.numeric(iris$Species),
     main = "Iris", xlab = "Sepal Length", ylab = "Petal Length")

# Principal Component Analysis
irisPCA <- prcomp(irisData, center = TRUE, scale. = TRUE)
summary(irisPCA)
irisPCA

# 3-D Visualisation
# install.packages("pca3d")
library(pca3d)
pca3d(irisPCA, group = iris$Species)
pca2d(irisPCA, group=iris$Species)
