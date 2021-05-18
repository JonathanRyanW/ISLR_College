library(ISLR)
dim(College)
View(College)
names(College)

"We will build a decision tree to predict whether a given college is private or 
public."

library(rpart)
library(rpart.plot)

college_dt <- rpart(formula = Private ~.,
                    data = College,
                    method = "class")

#Plotting the DT using rpart.plot package
prp(college_dt)

"Note that before creating the plot, the plot window needs to be enlarged."
