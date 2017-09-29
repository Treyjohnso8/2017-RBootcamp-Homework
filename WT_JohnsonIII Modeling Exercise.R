#EEB 201: Introduction to R for Ecology and Evolutionary Biology
#Bootcamp modeling exercises
#In class we saw how to simulate discrete-time models (such as the discrete logistic
#growth model) in R, using a for loop. Now we will work with an alternative model 
#for density-dependent population
#growth in discrete time, the Ricker model:
nn[tt+1]<-nn[tt]*exp((rr*(1-nn[t]/k)))

#where K > 0 and r can take positive or negative values.
#(a) Write a function that runs the Ricker model, plots the result, and returns the
#time series as an output. At minimum, your function should take all parameter values
#and initial conditions as input arguments.
nn<-rep(0)
tt<-rep(0)
rr<-rep(0)
kk<-rep(0)
rickerfunction<-function(nn,rr,kk){
for (tt in 1:100){
  nn[tt+1]<-nn[tt]*exp((rr*(1-nn[tt]/kk)))
}
  plot(nn, type = "l")
  return(nn)
}
rickerfunction(100,0.05,5000)

#(b) Explore the dynamics of the model. Try to find combinations of parameter values
#that yield the following patterns:
#• Population decreases to n = 0.
#• Population approaches stable equilibrium at n* = K, without oscillations.
#• Decaying oscillations around n* = K.
#• Persistent, regular oscillations.
#• Crazy, random-looking fluctuations (chaos).
#Which parameter is the key driver of these patterns?

#Decreases to n = 0
rickerfunction(100,-1,200)
#population aproaches stable equilibrium at n
rickerfunction(300,1.02,5000)
# N* = K with no oscilations
rickerfunction(300,1.02,5000)
# Decaying oscillations around n* = K.
rickerfunction(500,1.75,300)
# Persistent, regular oscillations for n* = K
rickerfunction(500,2.5,300)
# Crazy, random-looking fluctuations (chaos).
rickerfunction(500,3.29,300)

#Which is the key driver of these patterns
# The R value controls how the flutcuations happen, where the final value approaches,
#and the stability of the function

#(c) Choose six interesting values of this parameter. Write a script that makes an 
#array of six plots showing the model dynamics for each of these values.

par(mfrow=c(3,2))
rickerfunction(100,-1,200) #decreases to 0
rickerfunction(300,1.02,5000)# N* = K with no oscilations
rickerfunction(500,1.75,300) #Decaying oscillations around n* = K.
rickerfunction(500,2.5,300) # Persistent, regular oscillations for n* = K
rickerfunction(500,3.29,300) # Crazy, random-looking fluctuations (chaos).
rickerfunction(300,5,5000) #massive spikes after big die offs

dev.off()

#(d) Imagine n0 = 20 and K = 1000 for a certain population of deer that is growing
#according to the Ricker model. You are a wildlife manager, and are concerned about
#how long it will take for the population to reach half of its carrying capacity.
#That is, you want to know tK/2, the first year that nt ≥ K/2. Suppose your output
#time series is called nVec. Write an R command that will determine the index of the
#first element of nVec that is ≥ K/2.
kk<-1000
nVec<-rickerfunction(20,0.5,1000)
nmin<-min(which(nVec>=kk/2));nmin
nVec[nn==1]

#(e) Write a script that runs the necessary simulations and collects the necessary
#data to plot how tK/2 depends on r, for the range of r from 0.1 to 0.9.
#for rr from 0.1 to 0.9 take tt at kk/2
rvalues<-seq(0.1,0.9,0.1)
r_halfk<-seq(1,length(rvalues))

for (rr in 1:length(r_halfk)){
  newricker<-rickerfunction(20,rvalues[rr],1000)
  r_halfk[rr]<-min(which(newricker>=kk/2))
};plot(rvalues,r_halfk)


#(f) Write pseudo-code to do a joint sensitivity analysis for two parameters. That is,
#choose a vector of values you’d like to consider for both r and K, and choose a 
#simple output from your model (e.g. population size at t = 10). Run the model for all
#possible combinaioins of these values and collect the results in a matrix with
#appropriate dimensions. Plot the results in some way.
#Hint: the straight-forward way to do this uses a ‘nested loop’.

#Psuedocode:
#1) Set parameter values
 
#2) Initialize the vectors for both the changing R and K values

#3) Create a matrix that will store the values of both vectors

#4) Make the for loop: for R from 0.1 to 0.9 by 0.1, and for (nested) K from 100 to 300
#by 50, run the rickerfunction to get the Nvalues corresponding to both sets of
#variables. Assign the new variables to the matrix created before with columns for
#both the R and K values

#5) Plot the values using contour() or image()

#(g) Convert your pseudo-code into an R script to do a two-dimensional sensitivity
#analysis, and create a visually appealing plot to summarize the results. (You will
#need to google for plotting commands, e.g. contour or surface plots).
rvalues<-seq(0.1,0.9,0.1)
kvalues<-seq(100,300,50)
mathalfk<-matrix(NA,length(rvalues),length(kvalues))
r_halfk<-seq(1,length(rvalues))

for (rr in 1:length(r_halfk)){
  for (kk in 1:length(kvalues)){
    newricker<-rickerfunction(20,rvalues[rr],kvalues[kk])
    mathalfk[rr,kk]<-min(which(newricker>=kvalues[kk]/2))
  }};image(mathalfk)


#(h) (BONUS, OPTIONAL) Write a script to make a bifurcation plot for this model,
#showing how its long-term dynamics change as the parameter r is varied. You will need
#to collect a set of values reflecting the long-term dynamics of N for each value of
#r, where r falls between 0 and 4. Plot these N-values as points on the y-axis, versus
#the corresponding value of r on the x-axis.
#Hint: you may need to look up the R command matplot. If you get done with this
#and still have hunger for more, do it again using the apply function.


