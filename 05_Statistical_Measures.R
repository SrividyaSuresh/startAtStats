##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26June2019
# 05. Statistical Measures
##############################################################

# Load inbuilt data
df <- iris
x <- df$Sepal.Length
n = length(x)

# Statistical Measurements

# Minimum
min(x)

# Maximum
max(x)

# Mean (Arithmtic)
m = mean(x)

# Median
median(x)

# Mode
t <- table(x)
t
which.max(t)

# Quantiles
quantile(x, c(0.25,.5,.75))

# Boxplot
boxplot(x, col = 'pink', horizontal = T)

# Variance and Standard Deviation
v = sum((x-m)**2/(n-1))
var(x)
sd = sqrt(var(x))

# Coefficient of Variation
cv = sd/m

# Histogram
hist(x)

# Skewness
m2 = (sum((x-m)^2))/n
m3 = (sum((x-m)^3))/n
b1 = (m3^2)/(m2^3)
b1 = ifelse(m3<0,(-1)*b1,b1)
if (b1<0){
  print("Neg skewed")
}else{
  print("Pos skewed")
}

# Kurtosis
m4 = (sum((x-m)^4))/n
b2 = m4/(m2^2)
if (b2<3){
  print("platykurtic")
}else if(b2>3){
  print("leptokurtic")
}else{
  print("mesokurtic")
}

# 1
x = 71:80
f = c(2,8,10,14,16,25,14,12,11,3)
y = rep(x,f)
y
mean(y)
median(y)
which.max(table(y))
quantile(y,c(.25,.5,.75))
sd = sqrt(var(y))
cv = sd/mean(y)

# 2
ll = seq(20,90,10)
ul = seq(30,100,10)
x = (ll+ul)/2
f = c(8,13,16,21,17,12,8,5)
n = sum(f)
m1 = sum(f*x)/n
cf = cumsum(f)
mc = min(which(cf>=n/2))
l = ll[mc]
h = ul[mc]-ll[mc]
f1 = f[mc]
c = cf[mc-1]
m2 = l+((h/f1)*((n/2)-c))
m = which.max(f)
l = ll[m]
f1 = f[m]
f0 = f[m-1]
f2 = f[m+1]
h = ul[m]-ll[m]
m3 = l+h*(f1-f0)/(2*f1-f0-f2)
