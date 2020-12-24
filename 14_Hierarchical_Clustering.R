##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26June2019
# 14. Hierrarchical Clustering
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

# Hierarchical Clustering : Complete Linkage
hiercFit <- hclust(dist(irisData), method="complete") # average, single
hiercFit
plot(hiercFit, main="Complete Linkage", xlab="", ylab="", sub="", cex =.5)

K <- 2
rect.hclust(hiercFit, k = K)
plot(Sepal.Length, Petal.Length, pch = 19, 
     col = as.numeric(cutree(hiercFit, k = K)),
     main = "Iris", xlab = "Sepal Length", ylab = "Petal Length")

K <- 3
rect.hclust(hiercFit, k = K)
plot(Sepal.Length, Petal.Length, pch = 19, 
     col = as.numeric(cutree(hiercFit, k = K)),
     main = "Iris", xlab = "Sepal Length", ylab = "Petal Length")

# Confusion Matrix
hfitCluster <- as.factor(cutree(hiercFit, k = K))
(t <- table(iris$Species,hfitCluster))  
plot(t, col = 1:3)
