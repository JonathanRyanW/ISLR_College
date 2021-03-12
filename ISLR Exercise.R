#Use the read.csv() function to read the data into R. Call the loaded data
#college.

library(ISLR)
College

#Look at the data using the fix() function
fix(College)

#Use the summary() function to produce a numerical summary of the variables
summary(College)

#Use the pairs() function to produce a scatterplot matrix of the first ten
#columns or variables of the data.
pairs(College[,1:10])

#Use the plot() function to produce side-by-side boxplots of Outstate vs Private.
plot(College$Private, College$Outstate)

#Create a new qualitative variable, called Elite, by binning the Top10perc
#variable. We are going to divide universities into two groups based on whether
#or not the proportion of students coming from the top 10 % of their high school
#classes exceeds 50 %.

Elite <- NULL
for (i in 1:777){
  if (College[i, "Top10perc"] > 50) {
    Elite[i] <- "Yes"
  } else{
    Elite[i] <- "No"
  }
}
College$Elite <- Elite
rm(Elite, i)

#Use the summary() function to see how many elite universities there are.
summary(as.factor(College$Elite))
"There are 78 Elite universities."

#Now use the plot() function to produce side-by-side boxplots of Outstate vs
#Elite.
plot(as.factor(College$Elite), College$Outstate)

#Use the hist() function to produce some histograms with differing numbers of
#bins for a few of the quantitative variables. You may find the command
#par(mfrow=c(2,2)

par(mfrow = c(2,2))
hist(College$Outstate)
hist(College$Books)
hist(College$Personal)
hist(College$Expend)

#Continue exploring the data, and provide a brief summary of what you discover.
'I have already done some EDA on the data. It is not finished but the EDA is
already extensive.'