library(ISLR)
data <- College
names(data)

"The following packages will be used during the analysis"
library(ggplot2)
library(dplyr)

"The variables are as follows
Private : Public/private indicator
Apps : Number of applications received
Accept : Number of applicants accepted
Enroll : Number of new students enrolled
Top10perc : New students from top 10 % of high school class
Top25perc : New students from top 25 % of high school class
F.Undergrad : Number of full-time undergraduates
P.Undergrad : Number of part-time undergraduates
Outstate : Out-of-state tuition
Room.Board : Room and board costs
Books : Estimated book costs
Personal : Estimated personal spending
PhD : Percent of faculty with Ph.D.’s
Terminal : Percent of faculty with terminal degree
S.F.Ratio : Student/faculty ratio
perc.alumni : Percent of alumni who donate
"

"We do not need the row names. Turning them into Name column instead."
data$Name <- row.names(data)
row.names(data) <- 1:777
data <- select(data, Name, Private:Grad.Rate)

"This dataset looks very interesting. There are so many possible connections
between the data!"


