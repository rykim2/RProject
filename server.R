library(ggplot2)
library(shiny)
costOfLiving <- read.csv("https://raw.githubusercontent.com/rykim2/RProject/master/movehubcostofliving.csv")
source("https://raw.githubusercontent.com/rykim2/RProject/master/CostOfLivingDataSet.R")
shinyServer(
  function(input, output) {
    
    selectedData <- function(input1, input2){
      temp <- final.costOfLiving[c(which(final.costOfLiving$City == input1), 
                                 which(final.costOfLiving$City == input2)), as.numeric(input$radio)]
      
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

  }
)
