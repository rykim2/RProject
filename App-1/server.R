library(ggplot2)
library(shiny)

poundsToDollars <- function(x) x * 1.25

coliv.adjusted <- as.data.frame(lapply(costOfLiving[,2:7], poundsToDollars))

final.costOfLiving <- cbind(City = costOfLiving$City, coliv.adjusted)

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
    
    p.order <- function(radio, city){
      temp <- c(order(final.costOfLiving[as.numeric(radio)], decreasing = F))
        if (radio == 7){
          temp <- c(order(final.costOfLiving[as.numeric(radio)], decreasing = T))
        }
      index <- which(final.costOfLiving$City == city)
      col <- noquote(names(final.costOfLiving[as.numeric(radio)]))
      result <- c(match(index,temp), col)
      return(result)
    }
    
    price.rank1 <- reactive(p.order(input$radio, input$selectBar))
    price.rank2 <- reactive(p.order(input$radio, input$selectBar2))
    
    output$info1 <- renderText({
      paste(input$selectBar, ": ", "$",values()[1], ". ", sep = "")
    })
    output$info1.2 <- renderText({
      paste(input$selectBar, " is ", price.rank1()[1]," out of 216 place in the best city for ", 
            price.rank1()[2], sep = "")
      
    })
    output$info2 <- renderText({
      paste(input$selectBar2, ": ", "$",values()[2], ". ", sep = "")
    })
    output$info2.2 <- renderText({
      paste(input$selectBar2, " is ", price.rank2()[1]," out of 216 place in the best city for ", 
            price.rank2()[2], sep = "")
    })
    
    
    
    
  
  }
)
