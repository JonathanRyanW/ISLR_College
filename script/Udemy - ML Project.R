# Get the Data
# Call the ISLR library and check the head of College
# Then reassign College to a dataframe called df

library(ISLR)
df <- College

# EDA
# Create a scatterplot of Grad.Rate vs Room.Board, colored by Private column.
library(ggplot2)
ggplot(data = df, aes(x = Room.Board, y = Grad.Rate)) +
  geom_point(aes(color = Private)) +
  theme_bw()

#Create a histogram of full time undergrad students, color by Private.

ggplot(data = df, aes(x = F.Undergrad)) +
  geom_histogram(aes(fill = Private), color = "black") +
  theme_bw()

# Create a histogram of Grad.Rate colored by Private.
# You should see something odd here.

ggplot(data = df, aes(x = Grad.Rate)) +
  geom_histogram(aes(fill = Private), color = "black") +
  theme_bw()

# What college had a Graduation Rate of above 100%?
row.names(df)[df$Grad.Rate > 100]
df["Cazenovia College","Grad.Rate"]

"The college in question is Cazenovia College. That college has 118 Grad.Rate"

# Change that college's grad rate to 100%
df["Cazenovia College","Grad.Rate"] <- 100

# Train Test Split
# Split your data into training and testing sets 70/30.
# Use the caTools library to do this.

library(caTools)
set.seed(1001)
sample <- sample.split(df$Private, SplitRatio = 0.7)
train <- df[sample,]
test <- df[!sample,]

# Decision Tree
# Use the rpart library to build a decision tree to predict whether or not a
# school is Private. Remember to only build your tree off the training data.

library(rpart)
college_dt <- rpart(formula = Private ~.,
                    data = train,
                    method = "class")

#Use predict() to predict the Private label on the test data.
college_dt_prediction <- predict(college_dt, test)

# Check the Head of the predicted values. You should notice that you actually
# have two columns with the probabilities.

head(college_dt_prediction)

# Turn these two columns into one column to match the original Yes/No Label
# for a Private column.

Predicted <- c()
for (i in c(1:length(college_dt_prediction[,2]))) {
  if (college_dt_prediction[i,1] < college_dt_prediction[i,2]){
    Predicted[i] <- "Yes"
  } else {
    Predicted[i] <- "No"
  }
}
rm(i)

college_dt_prediction <- cbind(college_dt_prediction, Predicted)

#Now use table() to create a confusion matrix of your tree model.

table(Predicted, test$Private)

#Use the rpart.plot library and the prp() function to plot out your tree model.
library(rpart.plot)

prp(college_dt)

"Hmm, this is interesting, Our DT model only use 2 variables, that is the
F.Undergrad and Outstate. Even though we have 17 variables available as a
predictor."

# Calculating the DT accuracy
mean(Predicted == test$Private)

"This is not part of the project. Our accuracy is 66.52%. This is much lower
than the example in the notebooks (93.13%)"

# Random Forest
# Now let's build out a random forest model!
# Call the randomForest package library

library(randomForest)

# Now use randomForest() to build out a model to predict Private class. Add 
# importance=TRUE as a parameter in the model. (Use help(randomForest) to find
# out what this does.

college_rf <- randomForest(formula = Private ~.,
                           data = train,
                           importance = TRUE)

# What was your model's confusion matrix on its own training set?
college_rf$confusion

"This is a very good model, the accuracy is very high"

# Grab the feature importance. Refer to the reading for more info on what
# Gini[1] means.
college_rf$importance

"We can see that F.Undergrad and Outstate do have the 2 highest Mean Decrease
Gini. This is why the DT model only use those 2 variables."

# Predictions
# Now use your random forest model to predict on your test set!

college_rf_prediction <- predict(college_rf, test)

#Creating confusion matrix
table(college_rf_prediction, test$Private)

#Calculating accuracy
mean(college_rf_prediction == test$Private)

"The RF has 90.98% accuracy. Of course RF will perform better than a single DT.
THe difference between the accuracies are large. RF is definitely better even
though we lost the model interpretability."
