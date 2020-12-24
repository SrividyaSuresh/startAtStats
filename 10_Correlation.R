##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26June2019
# 10. Correlation
##############################################################

# Load and Explore data
ypsData <- read.csv("yps_data_condensed.csv")
names(ypsData)
ypsData$Height <- as.numeric(as.character(ypsData$Height))
ypsData <- ypsData[complete.cases(ypsData),]
plot(ypsData$Weight, ypsData$Height, type='p')

# Pearsons Correlation
cor(ypsData$Weight, ypsData$Height, method = "pearson")
cor.test(ypsData$Weight, ypsData$Height, method = "pearson")

# Kendall Rank Correlation 
cor(ypsData$Number.of.siblings, as.numeric(ypsData$Only.child), method = "kendall")
cor.test(ypsData$Number.of.siblings, as.numeric(ypsData$Only.child), method = "kendall")

# Spearman Rank Correlation
cor(as.numeric(ypsData$Gender), as.numeric(ypsData$Age), method = "spearman")
cor.test(as.numeric(ypsData$Gender), as.numeric(ypsData$Age), method = "spearman")

# Correlation Matrix
ypsNumeric <- ypsData[,sapply(ypsData, is.numeric)]
names(ypsNumeric)
cor(ypsNumeric)

# Correlation Plot
# install.packages("corrplot")
library(corrplot)
corrplot(cor(ypsNumeric))
corrplot.mixed(cor(ypsNumeric))

# Further Learning
# 1. Correlation vs Causation
# 2. Assumptions of Correlation
# 3. Correlation vs Coefficient of Variation
