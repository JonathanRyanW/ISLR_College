"The data used in this script is the College data from the ISLR package with
some pre processing in the README script"

"The following packages will be used during the analysis"
library(ggplot2)
library(dplyr)

table(data$Private)
"Most of the uni are private (565 out of 777 = 72.7%)"

#Creating Apps plot by Private
ggplot(data, aes(y = Apps, x = Private)) +
  geom_boxplot(aes(color = Private)) +
  ylab("Number of Applicants") +
  xlab("Type of Univeristy") +
  ggtitle("Number of Applicants by University Type") +
  theme_bw()

"There is an outlier with very high number of applicants. Rutgers at New
Brunswick has 48094 applicants. This number is unheard of in any other uni.
We will simply remove this observation from the plot"
ggplot(filter(data, Apps < 45000), aes(y = Apps, x = Private)) +
  geom_boxplot(aes(color = Private)) +
  ylab("Number of Applicants") +
  xlab("Type of Univeristy") +
  ggtitle("Number of Applicants by University Type") +
  theme_bw()

"We can see that the number of applicants for the private uni are very low
compared to the public uni. This seems logical since this is also true 
everywhere else in the world. Private unis always accept less students than
public ones and less students are applying in the first place."

#Creating Accept plot by Private
"Rutgers at New Brunswick is again an outlier. There are several other
outliers. In this plot, we will not omit these ouliers since the information
is still very clear"

ggplot(data, aes(y = Accept, x = Private)) +
  geom_boxplot(aes(color = Private)) +
  ylab("Number of Accepted Students") +
  xlab("Type of Univeristy") +
  ggtitle("Number of Accepted Students by University Type") +
  theme_bw()

#Plot after clearing some outliers
ggplot(filter(data, Accept < 15000), aes(y = Accept, x = Private)) +
  geom_boxplot(aes(color = Private)) +
  ylab("Number of Accepted Students") +
  xlab("Type of Univeristy") +
  ggtitle("Number of Accepted Students by University Type") +
  theme_bw()

"It is the same case with the number of accepted students. Private unis are
accepting less students than public ones. Makes sense since the number of
applicants are already lower."

#Creating Enroll plot by Private
ggplot(data, aes(y = Enroll, x = Private)) +
  geom_boxplot(aes(color = Private)) +
  ylab("Number of Enrolled Students") +
  xlab("Type of Univeristy") +
  ggtitle("Number of Enrolled Students by University Type") +
  theme_bw()

'Again, the same thing happens, the number of students enrolled in the private
unis are generally lower than the public unis.'

#Creating Top10perc plot by Private
ggplot(data, aes(y = Top10perc, x = Private)) +
  geom_boxplot(aes(color = Private)) +
  ylab("Number of Top 10% Students") +
  xlab("Type of Univeristy") +
  ggtitle("Number of Top 10% Students by University Type") +
  theme_bw()

"Ok now this is very interesting. Even though there are considerably less
students in the private unis, they actually have more students who are the
top 10% in their high school than the public unis. This means that the private
unis are more exclusive and the students are smarter than public unis"

#Creating Top25perc plot by Private
ggplot(data, aes(y = Top25perc, x = Private)) +
  geom_boxplot(aes(color = Private)) +
  ylab("Number of Top 25% Students") +
  xlab("Type of Univeristy") +
  ggtitle("Number of Top 25% Students by University Type") +
  theme_bw()

"The same thing applies for the top 25% students. Private schools, again, have
more of them than the public unis even though they have less students overall.
"

#Creating Room.Board plot by Private
ggplot(data, aes(y = Room.Board, x = Private)) +
  geom_boxplot(aes(color = Private)) +
  ylab("Room and Board Costs") +
  xlab("Type of Univeristy") +
  ggtitle("Room and Board Costs by University Type") +
  theme_bw()

"Oh, the room and board costs are higher for the private schools. Yea right
this is always true even in Indonesia. Private schools are more expensive than
public schools."

#Creating Books plot by Private
ggplot(data, aes(y = Books, x = Private)) +
  geom_boxplot(aes(color = Private)) +
  ylab("Books Costs") +
  xlab("Type of Univeristy") +
  ggtitle("Books Costs by University Type") +
  theme_bw()

"Wow, so in general the cost of books is actually higher for the public uni!
But some private unis have very high book costs. I wonder why the public unis
charge more for the books. Why is this true? Or maybe they charge the same
with small discrepancies among them. Books should costs the same whereever
you buy it, whomever you are. The fact that there are some outliers in the
private unis probably means that they are using non-standard books that
probably cost more than the standars ones."

#Creating Personal plot by Private
ggplot(data, aes(y = Personal, x = Private)) +
  geom_boxplot(aes(color = Private)) +
  ylab("Personal Spending") +
  xlab("Type of Univeristy") +
  ggtitle("Personal Spending by University Type") +
  theme_bw()

"Whaattt? Why is the personal spending of students from the public unis
higher than those from private unis? I don't understand. Private students
should be richer than the puclic students. Why are they not spending more?
Again, there are some outlier unis in which the students are spending money
so much more than others."

#Creating Terminal by Private plot
ggplot(data, aes(y = Terminal, x = Private)) +
  geom_boxplot(aes(color = Private)) +
  ylab("Terminal Degree") +
  xlab("Type of Univeristy") +
  ggtitle("Terminal Degreeby University Type") +
  theme_bw()

"Whaatt so the number of terminal degree is actually more at the public unis
than the private ones? So does this means that even though they are cheaper
and they accept more students, the public schools are actually better?"

#Creating PhD by Private plot
ggplot(data, aes(y = PhD, x = Private)) +
  geom_boxplot(aes(color = Private)) +
  ylab("PhD (Percentage)") +
  xlab("Type of Univeristy") +
  ggtitle("PhD Percentage by University Type") +
  theme_bw()

"First of all why is there a university with more than 100% PhD? Is this a
typo in the data?"

"Whaattt? So you are telling me that there are in general more PhD lecturer
per faculty in the public schools? Are you crazy? This gives more evidence
that public unis are actually better than private ones!"

#Creating Grad.Rate by Private plot
ggplot(data, aes(y = Grad.Rate, x = Private)) +
  geom_boxplot(aes(color = Private)) +
  ylab("Graduation Rate (Percentage)") +
  xlab("Type of Univeristy") +
  ggtitle("Graduation Rate Percentage by University Type") +
  theme_bw()

"Ok so private schools have higher graduation rate than public ones. There
are 2 ways to interpret this. 1: Students in private schools are more
determined and not so easy to give up than students in public schools. That's
why the graduation rate is higher. 2: It is harder to graduate from the public
unis because they are more demanding of their students, that is why the
graduation rate for public schools are lower."

