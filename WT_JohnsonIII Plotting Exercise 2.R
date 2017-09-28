#Plotting and genetic variation data analysis exercises, Assignment 2
#EEB 201: R bootcamp
#September 27, 2017
#Kirk Lohmueller
#All exercises use the SNPs in the file “hapmap_CEU_r23a_chr2_ld.txt” and the
#phenotypes in the file “pheno.sim.txt”.

#1. Researchers will often summarize P-values in genome-wide studies by
#making a QQ-plot. The QQ-plot has the observed (the ones you actually
#computed) P-values on the y-axis vs. the expected P-values on the x-axis.
#For a properly calibrated test, under the null hypothesis (i.e. meaning all
#the SNPs are in Hardy-Weinberg equilibrium) the observed P-values will
#follow a uniform distribution. This means that 1% of P-values will be <0.01,
#5% of P-values will be <0.05, 25% of P-values will be <0.25, etc. A QQ
#plot is a nice way to visualize whether the P-values indeed follow a
#uniform distribution.

#a. To start let’s revisit our tests of Hardy-Weinberg. Go back and
#perform the chi-square test for Hardy-Weinberg that we did in class
#on all SNPs in the “hapmap_CEU_r23a_chr2_ld.txt” file. Hint: you
#already have the code for this… Save your P-values in a vector
#called “pvals”.

snpsDataFrame=read.table('hapmap_CEU_r23a_chr2_ld-2.txt',header=TRUE)
head(snpsDataFrame)

compute_chisquare=function(x){
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)
  #print(obscnts)
  n=sum(obscnts)
  expcnts=c((1-freq)^2,2*freq*(1-freq),freq^2)*n
  chisq=sum((obscnts-expcnts)^2/expcnts)
  return(chisq)
}
compute_chisquare_2=function(x){
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)
  #print(obscnts)
  n=sum(obscnts)
  #here we use the built-in function for the chi-sq distribution:
  exp_probs=c((1-freq)^2,2*freq*(1-freq),freq^2) #note, here we don't multiply by n
  chisq<-chisq.test(obscnts,p=exp_probs, correct = FALSE)$statistic
  return(chisq)
}

chisqs=apply(snps,1,compute_chisquare)

pvals=pchisq(chisqs,1,lower.tail=FALSE)
head(pvals)

#b. What proportion of P-values from the test (put the vector called
#“pvals”) are <0.05? What proportion are <0.01? Are any <0.001?

pvals05<-which(pvals<0.05);pvals05
length(pvals05)/length(pvals) #0.04509218 or about 5% were <0.05
pvals01<-which(pvals<0.01);pvals01
length(pvals01)/length(pvals) #0.01021425 or about 1% were <0.01
pvalslittle<-which(pvals<0.001);pvalslittle
length(pvalslittle)/length(pvals) #0.00124564 or about 0.1% were <0.001

#c. How many SNPs were tested for departures from Hardy-Weinberg
#equilibrium? Hint: How many P-values do you have? Second hint:
#Try using the “length” function. Save this value in the variable called
#“num_pval”.

num_pval<-length(pvals) #4014 were tested

#d. Say that you have “num_pval” total P-values. Assuming that the
#null hypothesis is true (i.e. all SNPs are in Hardy-Weinberg), the
#smallest P-values is expected to be 1/num_pval. The second
#smallest P-value is expected to be 2/num_pval. The third smallest
#P-value is expected to be 3/num_pval, etc. The largest P-value is
#expected to be num_pval/num_pval (or 1). Calculate the vector of
#expected P-values for the chi-square test. Save these in the vector
#called “exp_pvals”.

exp_pvals<-seq(1,num_pval,by=1)

for (pv in 1:num_pval){
  exp_pvals[pv]<-pv/num_pval
}
plot(exp_pvals)

#e. The observed P-values in the “pvals” vector are in the order that
#they SNPs appear across the chromosome. We need to sort them, 
#smallest to largest. Use the “sort” function to sort the P-values.
#Store them in the vector “sort_pvals”.
sort_pvals<-sort(pvals);sort_pvals

#f. In order to see what is happening with the small P-values (these 
#are the ones we really care about), people often take the –log10(Pvalue).
#Find the –log10 of the observed and expected P-values.
#Store these in the vector “log_sort_pvals” and “log_exp_pvals”.
log_sort_pvals<-(-log(sort_pvals))
length(log_sort_pvals)
log_exp_pvals<-(-log(exp_pvals))
length(log_exp_pvals)

#g. You’re ready to make the QQ plot! Plot the “log_sort_pvals” vs. the
#“log_exp_pvals”.
plot(log_exp_pvals,log_sort_pvals)

#h. Where should these P-values fall under the null hypothesis? They
#should fall along the diagonal. Add a diagonal line to the QQ plot.

qqline(log_sort_pvals,col="red",lty=2)

#i. When you’re done, your plot should look something like this:
#(see web page)



#2. Researchers are very interested in testing whether certain alleles are
#present in higher frequency in individuals with traits, such as type 2
#diabetes. We have blood glucose levels for the 60 individuals in this study.


#a. Load the file “pheno.sim.2014.txt”. Store the phenotypes in a data
#frame called “zz”. The second column in this file contains the blood
#glucose measurements. Hint: you probably want to use “header=T”
#in the “read.table” command.
zz<-read.table('pheno.sim.2014-2.txt',header=TRUE)
head(zz)


#b. Find the value of the phenotype such that 25% of the individuals
#have a phenotype LESS than this value.
?quantile()

#c. Find the value of the phenotype such that 25% of the individuals
#have a phenotype GREATER than this value (i.e. 75% of the
#individuals have a phenotype LESS than this value).

#d. Make a density plot of the distribution of phenotypes (i.e. the blood
#glucose levels). Add vertical lines to the plot to denote the 25% and
#75% tails of the distribution.