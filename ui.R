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
      
      sliderInput(inputId = "slider", label = "Range of Interest:", 
                  min = 0, max = 100, value = c(0,100)),
      
      radioButtons(inputId = "radio", label = h2("Know your numbers"),
                         choices = list("Cappuccino" = 1, 
                                        "Cinema" = 2, 
                                        "Wine" = 3,
                                        "Gasoline" = 4, 
                                        "Average Rent" = 5, 
                                        "Average Disposable Income" = 6), selected = 3)
      ),
    mainPanel(
      h1("Introducing Shiny"),
      plotOutput("density")
      
    )
))

