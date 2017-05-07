library(ggplot2)
library(shiny)
costOfLiving <- read.csv("https://raw.githubusercontent.com/rykim2/RProject/master/movehubcostofliving.csv")
source("https://raw.githubusercontent.com/rykim2/RProject/master/CostOfLivingDataSet.R")
shinyServer(
  function(input, output) {
    
    # p.var <- switch(input$radio, 
    #                 "Cappuccino" = 1,
    #                 "Cinema" = 2,
    #                 "Wine" = 3,
    #                 "Gasoline" = 4,
    #                 "Average Rent" = 5,
    #                 "Average Disposable Income" = 6)
    # 

    selectedData <- function(input1, input2){
      temp <- final.costOfLiving[c(which(final.costOfLiving$City == input1), 
                                 which(final.costOfLiving$City == input2)), 4]
      
      # city1 <- temp[1]
      # city2 <- temp[2]
    }
    
    values <- reactive(selectedData(input$selectBar, input$selectBar2))
    
    
    output$text1 <- renderText({ 
      paste("You have selected", input$selectBar)
    })
    
    output$text2 <- renderText({
      paste("You have selected", input$selectBar2)
    })
    
    output$text3 <- renderText({
      values()
    })
    
    
    
  
    
    
    
    # output$density <- renderPlot({
    #   p.var <- switch(input$radio, 
    #                  "Cappuccino" = 1,
    #                  "Cinema" = 2,
    #                  "Wine" = 3,
    #                  "Gasoline" = 4,
    #                  "Average Rent" = 5,
    #                  "Average Disposable Income" = 6)
    #   
    #   color <- switch(input$radio,
    #                   "Cappuccino" = "orange",
    #                   "Cinema" = "blue",
    #                   "Wine" = "purple",
    #                   "Gasoline" = "lightgreen",
    #                   "Average Rent" = "pink",
    #                   "Average Disposable Income" = "lightblue")
    #   
    #   cityA <- input$selectBar
    #   cityB <- input$selectBar2
    #   
    #   graphDensity(Comparevar = p.var, 
    #                colorz = color, 
    #                city1 = cityA, 
    #                city2 = cityB)
    # })
  }
)
