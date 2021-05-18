# rpart(formula, data, method, control)

# Formula is in the format: outcome ~ predictor1+predictor2+predictor3+etc
# data= specifies the data frame
# method= "class" for a classification tree, "anova" for a regression tree
# control= optional parameters for controlling tree growth.

# For example:
# control = rpart.control(minsplit=30, cp=0.001)
# requires that the minimum number of observations in a node be 30 before
# attempting a split and that a split must decrease the overall lack of fit by a
# factor of 0.001 (cost complexity factor) before being attempted.

"We will use the kyphosis dataset as an example. We will try to predict whether
the child has kyphosis given their age, the number of vertebrae operated on, and
the topmost vertebrae operated on. The kyphosis is part of the rpart package."

#A look on the dataset
?kyphosis
head(kyphosis)
dim(kyphosis)

#Loading the packages
library(rpart)
library(rpart.plot)
library(randomForest)

#Creating the Decision Tree
kyphosis_tree <- rpart(formula = Kyphosis ~ .,
                       data = kyphosis,
                       method = "class")

print(kyphosis_tree) #Results of the DT
summary(kyphosis_tree) #Detailed results of the DT
printcp(kyphosis_tree)

"It is interesting that the DT does not use Number at all to predict Kyphosis."

#Creating the Decision Tree plot using the built in function
plot(kyphosis_tree, uniform = TRUE)
text(kyphosis_tree, use.n = TRUE, all = TRUE)

#Creating the Decision Tree plot using the rpart.plot package
prp(kyphosis_tree)

"The plot looks much better when plotted using the rpart.plot package."

#Creating a Random Forest model
kyphosis_random_forest <- randomForest(formula = Kyphosis ~.,
                                       data = kyphosis)

#Evaluating the RF
print(kyphosis_random_forest)
kyphosis_random_forest$confusion

"The error rate is 19.75%. This is not a bad error rate. However in the
medical setting, we should strive to be able to detect kyphosis correctly
among the children who actually have them. Out of all 17 children who has
kyphosis, we successfully predicted 5 of them (29.41%). Most of those children
went on to their homes not knowing that they have kyphosis.

Out model should have better sensitivity!"

importance(kyphosis_random_forest)

"We can see that the Mean Decrease Gini for Number is so small compared to Age
and Start. This indicated that Number is of little importance as a predictor
in the presence of Age and Start."

kyphosis_random_forest$ntree

#Grabbing the predicted values
kyphosis_random_forest$predicted




