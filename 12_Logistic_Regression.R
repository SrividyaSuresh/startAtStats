##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26June2019
# 12. Logistic Regression
##############################################################

# Load the dataset and explore
# install.packages("ISLR")
library("ISLR")
attach(Default)
help(Default)
defData <- data.frame(Default)
str(defData)
summary(defData)

# Visualisations
plot(defData$default, defData$balance,
     xlab = "Default", ylab = "Balance")

plot(defData$default, defData$income,
     xlab = "Default", ylab = "Income")

plot(defData$default, defData$student,
     xlab = "Default", ylab = "Student")

# Logistic Model
logFit <- glm(default ~ balance, 
              data = defData,                   
              family = binomial(link='logit'))  
summary(logFit)

# Predict using the model
probData <- predict(logFit, type = "response", newdata = defData)

# Convert probabilities to predictions
predData <- rep("No", nrow(defData))
predData[probData > 0.5] = "Yes"     
predData <- as.factor(predData)

# Confusion matrix for predictions
table(defData$default, predData)
summary(defData$default)

# Performance measures for Prediction
cm <- table(defData$default, predData)
TP <- cm[2,2]  # True Positive (Yes predicted as Yes)
TN <- cm[1,1]  # True Negative (No predicted as No)
FP <- cm[1,2]  # False Positive (No predicted as Yes) -- Type I error
FN <- cm[2,1]  # False Negative (Yes predicted as No) -- Type II error

# Classification Accuracy
(TN + TP) / (TN + TP + FN + FP)    
mean(predData == defData$default)  

# False Positive Rate (fpr) / Type I error
FP / (TN + FP)      # False Positive / Total Negative
1 - FP / (TN + FP)  # Specificity = 1 - (Type I error)

# True Positive Rate / Sensitivity / Recall / Power
TP / (TP + FN)      # True Positive / Total Positive
1 - TP / (TP + FN)  # Type II error = 1 - Sensitivity


# Fit logistic model for Default ~ Balance + Income + Student
logFit <- glm(default ~ balance + income + student, 
              data = defData,                    
              family = binomial(link='logit'))   
summary(logFit)

# Predict using the model
probData <- predict(logFit, type = "response", newdata = defData)

# Convert probabilities to predictions
predData <- rep("No", nrow(defData))
predData[probData > 0.5] = "Yes"     
predData <- as.factor(predData)

# Confusion matrix for predictions
table(defData$default, predData)
summary(defData$default)

# Classification accuracy 
mean(predData == defData$default)  

# Check Receiver Operating Characteristic (ROC)
# install.packages("ROCR")
library(ROCR)
probData <- predict(logFit, type = "response", newdata = defData)
predData <- prediction(probData, defData$default)
perfData <- performance(predData, measure = "tpr", x.measure = "fpr")
plot(perfData, main = "ROC Curve for Logistic Regression", colorize = TRUE)
abline(a = 0, b= 1)
perf.auc <- performance(predData, measure = "auc")
perf.auc@y.values[[1]]
