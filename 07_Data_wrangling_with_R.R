##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26June2019
# 07. Data Exploration and Wrangling with R
##############################################################

# Factor and Numeric Split
fact <- sapply(df, function(x) is.factor(x))
fact <- sapply(df, is.factor)
fact_df <- df[,fact]
num_df <- df[,!fact]

# Train Test Split
s <- sample(1:nrow(df),0.2*nrow(df), replace = F)
s
test_df <- df[s,]
train_df <- df[-s,]

# Dplyr
# install.packages('dplyr')
library(dplyr)
df[df$Village=='village' & df$Age==20,]
filter(df, Village=='village', Age==20)
arrange(df, Village, Age)[1:2,] #ascending
select(df, Weight)[1:5,]
select(df, contains('child'))[1:5,]
mutate(df, Height_ft = Height/5)

# Stringr
# install.packages('stringr')
library(stringr)
a = 'abcde'
str_length(a)
str_sub(a,2,2) <- 'CAT'
str_to_upper(a)
str_split(a,"")
str_split(a,'c')

