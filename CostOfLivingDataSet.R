library(dplyr)
library(ggplot2)

poundsToDollars <- function(x) x * 1.25

coliv.adjusted <- as.data.frame(lapply(costOfLiving[,2:7], poundsToDollars))

final.costOfLiving <- cbind(City = costOfLiving$City, coliv.adjusted)
vec <- as.vector(final.costOfLiving$City)

