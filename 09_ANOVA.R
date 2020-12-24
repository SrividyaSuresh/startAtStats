##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26June2019
# 09. ANOVA
##############################################################

# One way Anova

# h0 : there is no significant effect of treatment on yield
# h1 : there is significant effect of treatment on yield

# 1
ma = c(9.3,9.4,9.6,10,12.4,13,10.4,11.1,12.2,13.5)
mb = c(12.2,11.4,13.2,14.4,15.4,13.4,14.2,10.5,10.8,12.4)
mc = c(10.2,8.7,9.7,12.1,11.4,12.4,11.8,13.4,14.5,15.4)
tr = c(ma, mb, mc)
n1 = length(ma)
n2 = length(mb)
n3 = length(mc)
exp = c(rep("exp1",n1), rep("exp2",n2), rep("exp3",n3))
anova = aov(tr~exp)
summary(anova)

# 2
muppet = c(11,7,8,14,11,10,5)
futurama = c(4,8,6,11,9,8)
news = c(4,3,2,2,3,6)
noprog = c(7,7,5,4,3,4,4,4)
tr = c(muppet, futurama, news, noprog)
n1 = length(muppet)
n2 = length(futurama)
n3 = length(news)
n4 = length(noprog)
exp = c(rep("exp1",n1), rep("exp2",n2), rep("exp3",n3), rep("exp4",n4))
anova = aov(tr~exp)
summary(anova)

# Two way Anova

# h01 : there is no significant effect of treatment on yield
# h11 : there is significant effect of treatment on yield
# h02 : there is no significant effect of blocks on yield
# h12 : there is significant effect of blocks on yield

# 3
exp1 = c(64,75,60,69,42)
exp2 = c(42,55,50,56,51)
exp3 = c(38,53,33,46,38)
exp4 = c(25,23,32,28,43)
x = c(exp1, exp2, exp3, exp4)
n1 = length(exp1)
n2 = length(exp2)
n3 = length(exp3)
n4 = length(exp4)
a = c(rep("c",n1+n2), rep("r",n3+n4))
b = c(rep("m",n1), rep("f",n2), rep("m", n3), rep("f",n4))
anova = aov(x~a+b)
summary(anova)

# 4
x = c(7.1,6.9,6.8,7,6.7,6.9,7.2,7,6.9,6.9,6.4,6.6,6.8,6.6,6.6,6.4,6.7,6.7,6.5,6.7,6.6,6.6,6.2,6.2,6.5,6.3,6.2,6.4,6.5,6.3)
a = c(rep("a",10), rep("b",10), rep("c",10))
b = c(rep("one",2), rep("two",2), rep("three",2), rep("four",2), rep("five",2),rep("one",2), rep("two",2), rep("three",2), rep("four",2), rep("five",2),rep("one",2), rep("two",2), rep("three",2), rep("four",2), rep("five",2))
anova = aov(x~a+b)
summary(anova)

# Multivariate Analysis of Variance
res.man <- manova(cbind(Sepal.Length, Petal.Length) ~ Species, data = iris)
summary(res.man)

# Look to see which differ
summary.aov(res.man)
