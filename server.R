library(ggplot2)
library(shiny)
costOfLiving <- read.csv("https://raw.githubusercontent.com/rykim2/RProject/master/movehubcostofliving.csv")
source("https://raw.githubusercontent.com/rykim2/RProject/master/CostOfLivingDataSet.R")
shinyServer(
  function(input, output) {
    
    selectedData <- function(input1, input2){
      temp <- final.costOfLiving[c(which(final.costOfLiving$City == input1), 
                                 which(final.costOfLiving$City == input2)), as.numeric(input$radio)]
      result <- c(temp[1], temp[2])
      return(result)
  
    }
    
    values <- reactive(selectedData(input$selectBar, input$selectBar2))

    
    output$text1 <- renderText({ 
      paste("You have selected", input$selectBar)
    })
    
    output$text2 <- renderText({
      paste("You have selected", input$selectBar2)
    })
    
    output$text3 <- renderText({
      values()[1]
    })

    graph <- function(input1){
      ggplot(final.costOfLiving, aes(final.costOfLiving[[as.numeric(input$radio)]])) +
        geom_density(color = "pink", fill = "pink") +
        geom_vline(xintercept = values()[1]  , color = "red") +
        geom_vline(xintercept = values()[2], color = "yellow")
      
    }
    graphMe <- reactive(graph(input$radio))
        
    output$plot1 <- renderPlot({
      graphMe()

      
    })

  }
)
