##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26 June 2019
# 01. Programming with R
##############################################################

# R as an uncomfortable calculator

2345+5432 # Addition
4567-2345
3154*5789
55^155
(158859+598222)*879354
(972-289.8897)^(7.5+1.3924)
((12-2.8)^1.5)+1.3924
(86589/258.598)/3897

# With assignments
x1 = 73
x2 = 101+36
x31 = x1+x2
x32 = sum(x1,x2)
x41 = x1*x2
x42 = prod(x1,x2)
x51 = x2-x1
log(x1,25) # log of x1 to base 25
x6 = round(x42,3)

# DataTypes
x <- 15646346.98
class(x)
x <- 4:10
class(x)
x <- 'rgh'
class(x)
x <- TRUE
class(x)
x <- 4+7i
class(x)

# Data Structures
# Vector, List, Matrix, Array, Dataframe

# Vector
x <- c(1,2,3)
class(x)
y <- c(x,4)
y
x <- c('1','2','3')
class(x)
y <- c(x,'4')
y
x <- seq(1:10)
x
x <- seq(from=1, to=2, by=0.1)
x
x <- c(4,'5')
x
x <- c(TRUE,FALSE, 4)
x
x <- c(TRUE,FALSE, '4')
x
x[2]
length(1:10)
length('point')
nchar('point')

# Matrix
m <- matrix(c(1:6),nrow=2,ncol=3)
m
dim(m)
class(m)
typeof(m)
x <- 1:3
y <- 34:36
m1 <- cbind(x,y)
m2 <- rbind(x,y)
m1[,1]
m1[x]

# Lists
x <- list(2,'r',list(1,2),TRUE)
x[[3]][[2]]
x <- c(1:5)
x <- as.list(x)
length(x)
class(x)
x <- list(a='ola',b=76, c=TRUE)
x
x[[1]]
x$a
x

# Data Frames
df <- data.frame('A' = rep(1,10), 'B' = letters[1:10], 'C' = 11:20)
df
class(df)
typeof(df)
head(df) # first 6
tail(df)
dim(df)
nrow(df)
ncol(df)
str(df)
names(df)
colnames(df)
df[,3]
df[1,]
df[[1,3]]
df[['C']]
typeof(df[['C']])
df['C']
typeof(df['C'])

# If Conditions
x <- as.integer(readline("Enter a number"))
if (x<0){
  print("Negative Number")
} else if (x>0){
  print("Positive Number")
} else print("Number is zero")

# For Loops
l <- list(1,2,3,4,5)
sumf = 0
for (i in l){
  sumf = sumf + i
}
sumf  

l <- list(c('H','T'), c('H','H'), c('T','T')) 
for (li in l){
  if (li[1]==li[2]){
    print('Win')
    break
  } else {
    print('Lose')
  }
}
  
# While loops
n <- 0
while(n<10){
  if (n%%2){
    print('Even')
  } else{
    print('Odd')
  }
  n = n + 1
}
x = readline("H or T?")
while (x!='H'){
  print('Play again')
  x = readline("H or T?")
}

# User defined function
f <- function(a){
  return(a^2)
}
f(4)
