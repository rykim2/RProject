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
      paste("You have selected:", input$selectBar)
    })
    
    output$text2 <- renderText({
      paste("You have selected:", input$selectBar2)
    })

    graph <- function(input1, input2, input3){
      ggplot(final.costOfLiving, aes(final.costOfLiving[[as.numeric(input$radio)]])) +
        geom_density(color = "pink", fill = "pink") +
        theme_bw() +
        geom_vline(xintercept = values()[1], color = "red" ) +
        geom_vline(xintercept = values()[2], color = "black") +
        geom_text(aes(x = values()[1], label = input2, y = 0), 
                  colour = "red", size = 5.5, angle = 90, vjust = 1.2, hjust = -2) +
        geom_text(aes(x = values()[2], label = input3, y = 0), 
                  colour = "black", size = 5.5, angle = 90, vjust = 1.2, hjust = -2) +
        theme(axis.text = element_text(size = 10)) +
        labs(x = names(final.costOfLiving[as.numeric(input$radio)]), y = "Density")
      
    }
    graphMe <- reactive(graph(input$radio, input$selectBar, input$selectBar2))
        
    output$plot1 <- renderPlot({
      graphMe()
    })
    
    output$info1 <- renderText({
      paste(input$selectBar, "is --- out of --- place in the best city to buy -- from")
    })
    output$info2 <- renderText({
      paste(input$selectBar2, "is --- out of --- place in the best city to buy -- from")
    })
  
  }
)
