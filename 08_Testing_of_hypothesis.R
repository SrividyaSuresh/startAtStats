##############################################################
# Statistics with R Workshop, IGNCA, 24,25,26June2019
# 08. Testing of Hypothesis
##############################################################

# 1
# h0 = mu<=mu0
# h1 = mu>mu0
mu0=3262
n=50
xbar= 2995
sigma=1100
zed=(xbar-mu0)/(sigma/sqrt(n))
zed
if (zed > qnorm(0.99)) 
  print("rej h0") else
    print("do not reject h0")

# 2
# h0 = mu<=mu0
# h1 = mu>mu0
mu0=98.6
n=18
xbar= 98.217
sn=0.684
alpha = 0.95
tee=(xbar-mu0)/(sn/sqrt(n))
tee
if (tee > qt(alpha,n-1)) 
  print("rej h0") else
    print("do not reject h0")

# 3
# h0 = p=p0
# h1 = p!=p0
n=300
p=27/n
q=1-p
p0=0.12
zed=(p-p0)/(sqrt(p*q/n))
zed
if (abs(zed) > qnorm(1-(0.05/2))) 
  print("rej h0") else
    print("do not reject h0")

# Testing of Hypothesis for pairs

# 4
# h0 = p1>=p2
# h1 = p1<p2
x1=130
n1=750
x2=160
n2=700
a=0.05
p1=x1/n1
p2=x2/n2
pstar=(x1+x2)/(n1+n2)
qstar=1-pstar
zed=(p1-p2)/sqrt(pstar*qstar*((1/n1)+(1/n2)))

# 5
# h0 = mu1<=mu2
# h1 = mu1>mu2
new=c(42.1,41.3,42.4,43.2,41.8,41.0,41.8,42.8,42.3,42.7)
old=c(42.7,43.8,42.5,43.1,44.0,43.3,43.6,43.5,41.7,44.1)
x1=mean(new);x1
x2=mean(old)
n1=length(new)
n2=length(old)
s1=var(new);s1
s2=var(old)
sp=(((n1-1)*s1)+((n2-1)*s2))/(n1+n2-2);spvar
tee=(x1-x2)/sqrt(sp*((1/n1)+(1/n2)))
tee
a=0.05
if (tee > qt(1-a,n1+n2-2)) 
  print("rej h0") else
    print("do not reject h0")

# 6
# h0 = mua<=0
# h1 = mua>0
b=c(0.43,0.266,0.567,0.531,0.707,0.716,0.651,0.589,0.469,0.723)
s=c(0.415,0.238,0.39,0.41,0.605,0.609,0.632,0.523,0.411,0.612)
d=b-s
d
n=length(d);n
dbar=mean(d);dbar
sdd=var(d);sdd
a=0.05
tee=dbar/sqrt(sdd/n)
tee
if (abs(tee) > qt(1-a,n-1)) 
  print("rej h0") else
    print("do not reject h0")
