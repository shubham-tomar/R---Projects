library(shiny)

shinyUI(fluidPage(
    titlePanel(title = h4("Iris Dataset", align="center")),
    sidebarLayout(
        sidebarPanel(
            selectInput("var", "1. Select the variable from the iris dataset", choices =c("Sepal Length" = 1,
                                   "Sepal Width" = 2, "Petal Length" = 3, "Petal Width" = 4), selected = 1),
            
            sliderInput("bins", "2. Select the number of BINs for histogram", min=5, max = 25, value=15),
             
            radioButtons("color", "3. Select the colour of histogram",
                         choices=c("Green", "Red", "Yellow"), selected ="Green")
            
        ),
        
        mainPanel(
            tabsetPanel(type="tab", 
                        tabPanel("Summary",verbatimTextOutput("sum")),
                        tabPanel("Structure", verbatimTextOutput("str")),
                        tabPanel("Data", tableOutput("data")),
                        tabPanel("Plot", plotOutput("myhist"))
            )
        )
    )
))