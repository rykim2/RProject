# Define UI for application that draws a histogram
library(shiny)
costOfLiving <- read.csv("https://raw.githubusercontent.com/rykim2/RProject/master/movehubcostofliving.csv")

shinyUI(fluidPage(
  titlePanel("Learn. Explore. Live."),
    sidebarPanel(
      helpText("Select the which city you would like to explore."),
      
      selectInput(inputId = "selectBar", "Compare: City 1", 
                  choices = sort(costOfLiving$City), selected = "San Francisco"),
      
      selectInput(inputId = "selectBar2", "Compare: City 2", 
                  choices = sort(costOfLiving$City) , selected = "Honolulu"),
      
      radioButtons(inputId = "radio", label = h2("Know your numbers"),
                         choices = list("Cappuccino" = 2, 
                                        "Cinema" = 3, 
                                        "Wine" = 4,
                                        "Gasoline" = 5, 
                                        "Average Rent" = 6, 
                                        "Average Disposable Income" = 7), selected = 3),
      
      br(),
      br(),
      textOutput("info1"),
      textOutput("info1.2"),
      br(),
      textOutput("info2"),
      textOutput("info2.2")
      
      ),
    mainPanel(
      fluidRow(
        splitLayout(cellWidths = c("50%", c("25%", "25%")), 
                    img(src = "https://raw.githubusercontent.com/rykim2/RProject/master/www/seattle.jpg", height = "200", width = "600"), 
                    img(src = "https://raw.githubusercontent.com/rykim2/RProject/master/www/hawaii.jpg", height = "200", width = "200"), 
                    img(src = "https://raw.githubusercontent.com/rykim2/RProject/master/www/japaneseTea.jpg", height = "200", width = "200"))
      ),
      h1("Know Your City"),
      textOutput("text1"),
      textOutput("text2"),
      plotOutput("plot1"),
      br()
      )
))

