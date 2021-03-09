"We have looked at the correlations plot. We sees that the correlation between
top10perc and top25perc is very strong. This makes sense because if a uni is 
chosen by the very smart kids, the less smart but still hella smart kids are
probably choosing the same uni. Just like all the smart kids always want to go
to the same school."

cor(data$Top10perc, data$Top25perc) 

"0.891995. Very very strong positve correlation."

"What's interesting is the correlation between Grad.Rate and both top25perc and
top10perc. Of course. That would be very logical that because the kids in the
top 10 or 25 percent did not get there because of luck, they are the top 10 or
25 percent because they are smart. Smart kids of course have higher chance of 
successfully graduated. Thus the more top 10 or 25 students there are in a uni,
the higher the graduation rate.

But the effect should be small because the number of these top 10 or 25 students
is very low. Could it be that being targeted by top 10 or 25 percent students
indicates that the uni is also targeted by smart but not enough smart to be in
the top 25 percent kids? This could explain the correlation. It is not the
number of top 10 or 25 percent kids that rises the graduation rate, it is
the students in general being smart that rises the rate."

ggplot(data, aes(x = Top10perc, y = Top25perc)) +
  geom_point() +
  theme_bw()

"This relationship is probably not linear, it is most certainly quadratic."

ggplot(data, aes(x = Top10perc, y = Top25perc)) +
  geom_point() +
  geom_smooth(aes(group = 1), color = "red", se = FALSE) +
  theme_bw()

cor(data$Top10perc, data$Grad.Rate) #0.4949892
cor(data$Top25perc, data$Grad.Rate) #0.4772812

#Creating scatter plots
ggplot(data, aes(x = Top10perc, y = Grad.Rate)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme_bw()

ggplot(data, aes(x = Top25perc, y = Grad.Rate)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme_bw()

"Both are positively correlated with graduation rate. This happens because
the three variables all rises as a university is deemed as top university.
When people have the perception that a university is a top uni, they will
want to get in more, this includes the smarter kids, not just top 10 or 25,
but smarter kids in general. This is why the graduation rate is higher, the
students are simply smarter.