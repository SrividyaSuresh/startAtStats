##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26 June 2019
# 03. Visualisation in R
##############################################################

# Bar Plot
emp = c(51600, 19283, 15325, 14995, 12000)
comp = c("Disney world","Floridahospital","Publix Supermarket Inc.","Wal-mart Stores Inc.","Universal Orlando")
barplot(emp, names.arg = comp, 
        col = 1:5, 
        main = "Top Employers",
        xlab = 'Company',
        ylab = 'Number of Employers')
legend('topright',
       legend = comp,
       col = 1:5,
       pch = rep(15,5))

# bar2
b=c(69,77,14,12,71)
c=c(251,175,64,8,11)
m=cbind(b,c)
barplot(t(m),names.arg=c("Mammals","Birds","Reptiles","Amphibians","Fishes"),col=1:2,main="Endangered wildlife species",ylab="Species",xlab="Number of endangered species",beside=T)
legend("topright",legend=c("US","Foreign countries"),col=1:2,pch=c(15,15))

# Pie Chart
d=c(46,18,15,14,6,1)
pie(d,main="US Federal spending",labels=c("entitlements","defense","grants","interest on debt","federaloperations","deposit insurance"),col=1:5)

# Histogram
a=c(3,5,7,9,11,13,15,17)
b=c(4,8,15,30,35,28,14,4)
f=rep(a,b)
hist(f)

# Scatter Plot
a = 1:10
b = seq(1,20,2)
plot(a,b)

# Box Plot
x = rnorm(1000,100,15)
boxplot(x, horizontal = T)

# Line Plot
lines(density(x), lwd = 3)
