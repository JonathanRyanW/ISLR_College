"The data used in this script is the College data from the ISLR package with
some pre processing in the README script"

library(corrgram)
library(corrplot)

cor.data <- cor(data[, 3:19])
correlations <- corrplot(cor.data, method = "color")

"There are some correlations right here. Some are very obvious, some other are
interesting. Let's discuss all of them one by one"