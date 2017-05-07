library(ggplot2)
library(shiny)
costOfLiving <- read.csv("https://raw.githubusercontent.com/rykim2/RProject/master/movehubcostofliving.csv")
source("https://github.com/rykim2/RProject/blob/master/CostOfLivingDataSet.R")
 
shinyServer(
  function(input, output) {
    
    output$density <- renderPlot({
      p.var <- switch(input$radio, 
                     "Cappuccino" = "Cappuccino",
                     "Cinema" = "Cinema",
                     "Wine" = "Wine",
                     "Gasoline" = "Gasoline",
                     "Average Rent" = "Avg.Rent",
                     "Average Disposable Income" = "Avg.Disposable.Income")
      
      color <- switch(input$radio,
                      "Cappuccino" = "orange",
                      "Cinema" = "blue",
                      "Wine" = "purple",
                      "Gasoline" = "lightgreen",
                      "Average Rent" = "pink",
                      "Average Disposable Income" = "lightblue")
      
      cityA <- input$selectBar
      cityB <- input$selectBar2
      
      graphDensity(Comparevar = p.var, 
                   colorz = color, 
                   city1 = cityA, 
                   city2 = cityB)
    })
  }
)