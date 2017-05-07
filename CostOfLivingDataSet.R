library(dplyr)
library(ggplot2)

##Darianne's path
# costOfLiving <- read.csv("/Users/drl0110/Dropbox/Movehub GUI Final Project/movehubcostofliving.csv", header = TRUE)


#creating a function that takes a number in pounds returns the number in US dollars
poundsToDollars <- function(x) x * 1.25


# Rachel’s Work 04/18/2017 -----------------------------------------------------------

coliv.adjusted <- as.data.frame(lapply(costOfLiving[,2:7], poundsToDollars))

#adjusted to the right US currency
final.costOfLiving <- cbind(City = costOfLiving$City, coliv.adjusted)
vec <- as.vector(final.costOfLiving$City)

#------------------------------------ANOTHER WAY ATTEMPT ----------------------------------------------------------
# WORKS! WORKS! WORKS! WORKS! WORKS!


graphDensity <- function(Comparevar, colorz, city1, city2){
  
  partitionData <- cbind(final.costOfLiving["City"], final.costOfLiving[Comparevar])
  head(partitionData)
  
  getValue1 <- function(city1) {
    cityInfo1 <- partitionData[which(partitionData[,1] == city1), ]
    cityInfo1[[2]]
  }
  
  getValue2 <- function(city2){
    cityInfo2 <- partitionData[which(partitionData[,1] == city2), ]
    cityInfo2[[2]]
  }
  
  cityA <- getValue1(city1)
  cityB <- getValue2(city2)
  
  ggplot(final.costOfLiving, aes(final.costOfLiving[Comparevar])) +
    geom_density(color = colorz, fill = colorz) +
    geom_vline(xintercept = cityA, color = "red") +
    geom_vline(xintercept = cityB, color = "yellow")
  
}

graphDensity("Gasoline", "blue", "Geneva", "Honolulu")
