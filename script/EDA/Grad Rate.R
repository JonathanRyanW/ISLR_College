"The data used in this script is the College data from the ISLR package with
some pre processing in the README script"

library(ggplot2)

ggplot(data, aes(x = Grad.Rate, y = Books)) +
  geom_point(color = "#ff7f50") +
  geom_smooth(method = "lm", se = FALSE) +
  theme_bw()

'OMG there is almost 0 correlation between books and Grad.Rate'

ggplot(data, aes(x = Grad.Rate, y = Outstate)) +
  geom_point(color = "#ff7f50") +
  geom_smooth(method = "lm", se = FALSE) +
  ylab("Outstate Tuition") +
  xlab("Graduation Rate (Percentage)") +
  theme_bw()

ggplot(data, aes(x = Grad.Rate, y = Outstate)) +
  geom_point(aes(color = Private), size = 1.5, alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE) +
  ylab("Outstate Tuition") +
  xlab("Graduation Rate (Percentage)") +
  theme_bw()

"Wow! Why is graduation rate highly correlated with Outstate tuition cost? Do
people just work harder to graduate after they spent so much money?"

#Finding the correlation
cor(data$Grad.Rate, data$Outstate) #0.5712899

"Not a weak correlation."
