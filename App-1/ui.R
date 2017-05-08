# Define UI for application that draws a histogram
library(shiny)
shinyUI(fluidPage(
  titlePanel("Learn. Explore. Live."),
    sidebarPanel(
      helpText("Select the which city you would like to explore."),
      
      selectInput(inputId = "selectBar", "Compare: City 1", 
                  choices = c(vec), selected = "San Francisco"),
      
      selectInput(inputId = "selectBar2", "Compare: City 2", 
                  choices = c(vec), selected = "Honolulu"),
      
      radioButtons(inputId = "radio", label = h2("Know your numbers"),
                         choices = list("Cappuccino" = 2, 
                                        "Cinema" = 3, 
                                        "Wine" = 4,
                                        "Gasoline" = 5, 
                                        "Average Rent" = 6, 
                                        "Average Disposable Income" = 7), selected = 3)
      ),
    mainPanel(
      h1("Know Your City"),
      textOutput("text1"),
      textOutput("text2"),
      plotOutput("plot1"),
      textOutput("info1"),
      textOutput("info2")
    )
))

