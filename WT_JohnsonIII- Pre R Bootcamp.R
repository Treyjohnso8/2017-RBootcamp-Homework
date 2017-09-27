#4

2+2
a<-2+2
a
a<-3*(4+
        5)
a

x<-5
y<-2
z1<-x*y
z2<-x/y
z3<-x^y
z1
z2
z3

A<-3
C<-(A+2*sqrt(A))/(A+5*sqrt(A))
C

# Exercise 4.0.0.0.1
a<-(2^7)/((2^7)-1)
a
b<-(1-1/(2^7))^-1
b
c<-1+0.2
c
d<-1+0.2+((0.2^2)/2)
d
e<-1+0.2+((0.2^2)/2)+((0.2^3)/6)
e
f<-(exp(1))^0.2
f

#5

??foo #wouldnt take 1 ?. It suggested adding a second
help(foo)

#Exercise 5.0.0.0.1
??sin
help.search("sin")

#6
#6.1
Light<-c(20,20,20,20,21,24,44,60,90,94,101)
rmax<-c(1.73,1.65,2.02,1.89,2.61,1.36,2.37,2.08,2.69,2.32,3.67)

hist(rmax)

plot(rmax~Light)

#6.2
fit<-lm(rmax~Light)
summary(fit)
abline(fit)
coef(fit)

residuals(fit)
fitted(fit)
effects(fit)
vcov(fit)
anova(fit)

#7
#list of common functions for linear modeling

#8

install.packages("ggplot2")
install.packages(c("plyr","reshape2"))
install.packages("ggplot2",repos=NULL)

#9

#9.1
x<-c(1,3,5,7,9,11)
y<-c(6.5,4.3,9.1,-8.5,0,3.6)
z<-c("dog","cat","dormouse","chinchilla")
w<-c(a=4,b=5.5,c=8.8)

length(x)
mode(y)
mode(z)
names(w)

x<-x+1
xx<-sqrt(x)
x;xx
x+y

#Exercise 9.1.0.0.1
5%%2 #Rounds the remainder up (5/2= 2.5. 0.5 rounded up is 1)
5%/%2 #Takes the largest whole number without a remainder. (5/2 = 2.5. 2 is the largest whole number.)

#9.1.1
x<-c(1,2,3)
y<-c(10,20,30,40,50,60)
x+y
y-x

#Exercise 9.1.1.0.1
#If the lengths aren't equal the shorter one will repeat

#9.1.2
1:8

#Exercise 9.1.2.0.2
v<-seq(1,13,4)
v

v<-seq(1,5,0.2)
v

#Exercise 9.1.2.0.2
v<-seq(3,1)
v #it counts down instead of up.

rep(3,5)
rep(1:3,3)

rep(1:3,each=3)

rep(c(3,4),c(2,5))

#9.1.3
z<-c(1,3,5,7,9,11);z[3]
v<-z[c(2,3,4,5)]
v<-z[2:5];v

#Exercise 9.1.3.0.1
v<-z[seq(1,2,5)];v
#The sequence cannot run because the number between each jump exceeds the maximum.
#So 1 is the final number in the sequence

v<-z[c(1,2,5)];v
z[1]<-12
z[c(1,3,5)]<-c(22,33,44)

w
w["a"]
w[c("c","b")]
w["b"]<-0
w

#Exercise 9.1.2.0.2
zz<-z[c(2,1,3)]
zz

#Exercise 9.1.3.0.3
z[9]<-11

#Exercise 9.1.3.0.4
install.packages("ggplot2")
x<-1:10
y<-seq(0,0.9,0.1)
things<-(x-1)/(x+1)
thingsplotted<-plot(things,ylab="Y Axis",xlab="X Axis",main="Things")
lines(things)

#9.1.3.0.5
x<-1.999999;x;x-2
x<-1.9999999999999;x;x-2
x<-1.999999999999999999;x;x-2

#Exercise 9.1.3.0.6
n<-0:10;r<-0.5;G<-r^n;G

sum(G) #not the same
1/(1-r)

n<-0:50
G<-r^n;G #Ask Liz

#9.1.4
a<-1;b<-3
c<-a<b
d<-(a>b)
c;d

x<-1:5;b<-(x<=3);b

a=1:3
b=2:4
a==b

a=b
a==b

a<-c(1,2,3,4)
b<-c(1,1,5,5)
(a<b)|(a>3)

(a<b)||(a>3)

#9.1.5
lowLight<-Light[Light<50]
lowLightrmax<-rmax[Light<50]
lowLight
lowLightrmax

#Exercise 9.1.5.0.1
Light<-Light[Light<50] #You rewrite your data and dont have the original vector
Light

#Exercise 9.1.5.0.2
vector<-runif(20);vector
mvector<-mean(vector);mvector
lesvect<-vector[vector<mvector];lesvect

#Exercise 9.1.5.0.3
tfvector<-vector<mvector;tfvector
which(vector<mvector)

#Exercise 9.1.5.0.4
#1)
truefalse<-rep(c("TRUE","FALSE"),10)
vector[truefalse=="TRUE"]

#2)
lvect<-length(vector)
tf<-seq(1,lvect,2)
oddvect<-vector[tf];oddvect

#9.2

x<-matrix(c(1,2,3,4,5,6),nrow=2,ncol=3);x
a<-matrix(1:9,nrow=3,ncol=3,byrow=TRUE);a

#Exercise 9.2.1.0.1
v<-c(1,2,1,2,1,2,1,2)
x<-matrix(v,nrow=2,ncol=4);x
sum(x)

#Exercise 9.2.1.0.2
matdat<-rnorm(35,mean=1,sd=2)
matdatmatrix<-matrix(matdat,nrow=5,ncol=7)

A<-matrix(0,3,4)
data.entry(A) #Doesnt work

#9.2.2

C<-cbind(1:3,4:6,5:7);C
D<-rbind(1:3,4:6);D

#Exercise 9.2.2.0.1
#It will not work because the number of digits must be compatable to make the required matrix

rbind(C,D)
cbind(C,C)
cbind(C,D)

#9.3.0.0.1 Excercise
x <- seq(1,27)
dim(x) <- c(3,9)
is.array(x)
is.matrix(x)
x
?dim
#x has been made into a sequence and dim() has added dimensions to that sequence.
#is.array checks to see if the new format is an array, and is.matrix checks to see if its a valid matrix
#c(3,9) sets the dimensions of the array/matrix

#9.6
data.url<-"http://kingaa.github.io/R_Tutorial/ChlorellaGrowth.csv"
dat<-read.csv(data.url,comment.char='#')
dat

#Exercise 9.6.0.0.1
data.url<-"http://kingaa.github.io/R_Tutorial/hurricanes.csv"
hurricane<-read.csv(data.url,comment.char='#');hurricane
str(hurricane)

#11
course.url <- "http://kingaa.github.io/R_Tutorial/"
download.file(paste0(course.url,"Intro1.R"),destfile="Intro1.R",mode="w")
source("Intro1.R")
download.file(paste0(course.url,"Intro2.R"),destfile="Intro2.R",mode="w")
download.file(paste0(course.url,"ChlorellaGrowth.csv"),destfile="ChlorellaGrowth.csv",mode="w")

#Exercise 11.0.0.0.1
course.url <- "http://kingaa.github.io/R_Tutorial/"
download.file(paste0(course.url,"Intro1.R"),destfile="Intro1.R",mode="w")
source("Intro1.R")
download.file(paste0(course.url,"Intro2.R"),destfile="Intro2.R",mode="w")
download.file(paste0(course.url,"ChlorellaGrowth.csv"),destfile="ChlorellaGrowth.csv",mode="w")
course.url <- "http://kingaa.github.io/R_Tutorial/"
download.file(paste0(course.url,"Intro1.R"),destfile="Intro1.R",mode="w")
source("Algaestuff.R")
download.file(paste0(course.url,"Intro2.R"),destfile="Intro2.R",mode="w")
download.file(paste0(course.url,"ChlorellaGrowth.csv"),destfile="ChlorellaGrowth.csv",mode="w")

#Exercise 11.0.0.0.2
source("Intro2.R")
plot(fit)
?plot.lm
#Plot makes multiple plots that let you see how well the model fits your data.

#Exercise 11.0.0.0.3
chlordat<-read.csv("ChlorellaGrowth.csv",row.names = NULL);chlordat
chlordat$X..light...light.level
chlorlight<-as.numeric(chlordat[3:13,1]);chlorlight
chlorrmax<-as.numeric(chlordat[3:13,2]);chlorrmax
lightXrmax<-plot(x=chlorlight,y=chlorrmax,xlab="Growth Rate",ylab="Light",xlim=c(0,120),ylim=c(1,4))

#Exercise 11.0.0.0.4
loglightXrmax<-plot(x=log(chlorlight),y=log(chlorrmax),xlab="Growth Rate",
                          ylab="Light",xlim=c(0,120),ylim=c(1,4))

par(mfrow=c(2,1))
plot(x=chlorlight,y=chlorrmax,xlim=c(0,105),ylim = c(0,15),xlab = "Light",ylab = "Growth Rate",main = "Growth Rate X Light")
plot(x=log(chlorlight),y=log(chlorrmax),xlim=c(0,105),ylim = c(0,15),xlab = "Log(Light)",ylab = "Log(Growth Rate)",main = "Log(Growth Rate X Light)")

par(mfrow=c(1,2))
plot(x=chlorlight,y=chlorrmax,xlim=c(0,105),ylim = c(0,15),xlab = "Light",ylab = "Growth Rate",main = "Growth Rate X Light")
plot(x=log(chlorlight),y=log(chlorrmax),xlim=c(0,105),ylim = c(0,15),xlab = "Log(Light)",ylab = "Log(Growth Rate)",main = "Log(Growth Rate X Light)")


#Exercise 11.0.0.0.5
x<-3:8
y<-5*x+3
par(mfrow=c(2,2),mfcol=c(2,2))
plot(x,y,main = "First",col=5,type="s")
plot(x,y, main = "Second",col=2,type= "p")
plot(x,y, main = "Third",col=3,type = "c")
plot(x,y, main = "Fourth",col=4,type="o")

#Exercise 11.0.0.0.5
dev.print(file="graphs.png",device=png,width=600)

#12
phi <- 1
for (k in 1:100) {
  phi <- 1+1/phi
  print(c(k,phi))
}

#

a <- 1.1
b <- 0.001
T <- seq(from=1,to=200,by=1)
N <- numeric(length(T))
n <- 2
for (t in T) {
  n <- a*n/(1+b*n)
  N[t] <- n
}
plot(T,N)

# alternative

N <- numeric(length(T))
for (t in 1:length(T)) {
  n <- a*n/(1+b*n)
  N[t] <- n
}
plot(T,N)

#Exercise 12.1.0.0.2

a <- 1.1
b <- 0.001
T <- seq(from=1,to=200,by=1)
N <- numeric(length(T))
n <- 2
for (t in T) {
  n <- a*n/(1+b*n)
  N[t] <- n
}
plot(T,N)
#it only provides one value because the length of T doesn't allow for multiple iterations

a <- 1.1
b <- 0.001
T <- 0
N <- numeric(length(T))
n <- 2
for (t in T) {
  n <- a*n/(1+b*n)
  N[t] <- n
}
plot(T,N)
#One value again. 0 only allows for the loop to run once.

#12.2
phi <- 20
k <- 1
while (k <= 100) {
  phi <- 1+1/phi
  print(c(k,phi))
  k <- k+1
}

#Exercise 12.2.0.0.1
phi <- 20
conv <- FALSE
counter<-1
while (!conv) {
  phi.new <- 1+1/phi
  conv <- phi==phi.new
  phi <- phi.new
  counter<- counter+1
  cat(phi,phi.new,conv)
}
counter
phi.new
#it is working. it takes 41 iterations.

#Exercise 12.2.0.0.2
a <- 1.1
b <- 0.001
T <- seq(from=1,to=200,by=1)
N <- numeric(length(T))
n <- 2
t <- 1
while (t<=max(T)) {
  n <- a*n/(1+b*n)
  N[t] <- n
  t<-t+1
}
plot(T,N) 
#They are the same
