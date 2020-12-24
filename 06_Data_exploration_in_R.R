##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26June2019
# 06. Data Exploration and Wrangling with R
##############################################################

# Load data
df <- read.csv('yps_data_condensed.csv')

# Data View
dim(df)
names(df)
head(df)
tail(df)
View(df)
str(df)
summary(df)
unique(df)


# Rename columns
names(df) <- c("Age","Height","Weight","Siblings",
               "Gender","Education","Single_child",
               "Village","House")

# Check for missing values
sum(is.na(df))
for (c in c(1:ncol(df))){
  print(names(df)[c])
  print(sum(is.na(df[,c])))
}

# Check for anamolies
summary(df)

# Replace wierd values
df[df==''] <- NA
df <- droplevels(df)

# Column profiling
summary(df$Age)
boxplot(df$Age, horizontal = T, col = 'light blue')
hist(df$Age, col = 'light blue')

summary(df$Height)
length(df[df=='?'])
df[df=='?'] <- NA
df$Height <- droplevels(df$Height)
str(df$Height)
df$Height <-as.numeric(as.character(df$Height))
boxplot(df$Height, horizontal = T, col = 'light blue')
hist(df$Height, col = 'light blue')
summary(df$Height[df$Height<10])

summary(df$Weight)
boxplot(df$Weight, horizontal = T, col = 'light blue')
hist(df$Weight, col = 'light blue')

summary(df$Siblings)
boxplot(df$Siblings, horizontal = T, col = 'light blue')
hist(df$Siblings, col = 'light blue')
table(df$Siblings)
plot(table(df$Siblings))
str(df$Siblings)
df$Siblings[df$Siblings>6]
df$Siblings[df$Siblings>10] <- NA

summary(df$Gender)
str(df$Gender)
plot(df$Gender, col=1:2)
levels(df$Single_child) <- c(0,1)

summary(df$Education)
df$Education[df$Education=='school'] <- 'secondary school'
df$Education <- droplevels(df$Education)
plot(df$Education, col = c(1:length(levels(df$Education))))

summary(df$Single_child)
df$Single_child <- ifelse(df$Single_child=='no',0,1)
df$Single_child <- as.factor(df$Single_child)
plot(df$Single_child)

summary(df$Village)
plot(df$Village, col = 'dark green')

summary(df$House)
df$House[df$House=='block or flats'] <- 'block of flats'
df$House <- droplevels(df$House)
plot(df$House)

# Drop null values
df = df[complete.cases(df),]
dim(df)

# Missing Value Packages
# 1. missForest
# 2. mice 
# 3. Amelia 
# 4. Hmisc
