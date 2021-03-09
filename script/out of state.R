out.of.state <- "https://www.collegexpress.com/interests/public-colleges-and-universities/articles/financial-aid-public-colleges/everything-you-need-know-about-out-state-tuition/"

"In-state tuition refers to the rate paid by students with a permanent residence
in the state in which their university is located. Out-of-state tuition refers
to the rate that students coming from outside the state, including international
students, pay to attend a public state school."

#Creating Outstate plot by Private
ggplot(data, aes(x = Outstate, y = Private)) +
  geom_boxplot(aes(color = Private)) +
  xlab("Out of State Tuition") +
  ylab("Type of University") +
  ggtitle("Out of State Tuition Cost by Type of University") +
  coord_flip() +
  theme_bw()

"This plot was saved with 480 x 600."

"This is as expected. The private schools are of course asking for more money
than the public schools. Public schools get subsidize by the country while
private schools need to get their funding from tuition and investors. This is
why private schools tend to be more expensive than public ones."