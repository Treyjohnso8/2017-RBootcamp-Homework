#Plotting and genetic variation data analysis exercises, Assignment 1
#EEB 201: R bootcamp
#September 14, 2016
#Kirk Lohmueller
#Imagine that you wish to conduct a study of height of people living in Los Angeles. 
#One strategy is to take a sample of 100 people and compute the average height. 
#Another study design would involve taking a sample of 1000 people and computing
#the average height. You wish to test the extent to which the different sample sizes 
#affect your estimates of the average height. To test this, conduct a simple simulation
#study in R. Assume that the heights of people from LA are normally distributed with a 
#mean of 69 inches and a standard deviation of 10 inches. In order to conduct 
#the simulation study, you should do the following:


#1. Write a function (called “get_heights”) in R to draw a sample of individuals 
#(either 100 or 1000) from the population. Hint: You will want to use “rnorm” within your function. 
#Store the random heights that you’ve generated in a variable called “heights”.
get_heights<-function(heights=1000){   
  heights<-rnorm(heights,mean=69,sd=10)
  return(heights)
}
get_heights(heights=100)
#2. Within your function, compute the average height from your “heights” vector.
get_heights<-function(sample_heights=1000){   
  heights<-mean(rnorm(sample_heights,mean=69,sd=10))
return(heights)
}
sample_heights<-1000
get_heights(sample_heights)

#3. Make your function return the average height.
get_heights<-function(sample_heights=1000){   
  heights<-rnorm(sample_heights,mean=69,sd=10)
  return(mean(heights))
}
get_heights(sample_heights=100)                                                                         
                                                                                   
#4. Use a “for” loop to call your “get_heights” function 1000 times, with taking a sample of size
#100 from the population. Save the mean height from each replicate in a vector called
#“mean_heights_100”.
get_heights<-function(sample_heights=100){   
  heights<-rnorm(sample_heights,mean=69,sd=10)
  return(mean(heights))
}
get_heights(heights) 
mean_heights_100<-c(1:1000)
for (i in 1:1000){
  mean_heights_100[i]<-get_heights(sample_heights = 100)
} 
mean_heights_100
min(mean_heights_100)
max(mean_heights_100)
#5. Use a “for” loop to call your “get_heights” function 1000 times, with taking a sample of size
#1000 from the population. Save the mean height from each replicate in a vector called
#“mean_heights_1000”.
mean_heights_1000<-c(1:1000)
for (i in 1:1000){
  mean_heights_1000[i]<-get_heights(sample_heights = 1000)
} 
mean_heights_1000                                                                                
                                                                                   
#6. Plot a histogram of the distribution of the average heights for your sample size of 
#100 and 1000 individuals. The two sets of data should be plotted on the same axes. 
#Add a legend. Label the axes. Plot the data from the 100 samples in red and the data
#from the 1000 samples in blue. Your plot should look something like the one shown on
#the next page.

bins<-seq(65,75,by=0.5)
histthous<-hist(as.numeric(mean_heights_1000),breaks = bins)$counts
histhund<-hist(as.numeric(mean_heights_100),breaks = bins)$counts
par(mfrow=c(1,1), mar=c(4, 4, 3, 2))
bin.names<-bins[-21]
bin.names
boundplots<-rbind(histhund,histthous)
barplot(boundplots,col=c(2,4),beside=T,xlab="Value",ylab="Count",main="Counts",
        names.arg = bin.names)
legend(x=0,y=400,legend= c("n = 100","n = 1000"),col=c(2,4),pch = 19)
