library(shiny)

shinyServer(function(input, output) {
    
    colm <- reactive({
        as.numeric(input$var)
        
    })

    output$sum <- renderPrint({summary(iris)})
    
    output$str <- renderPrint({str(iris)})
    
    output$data <- renderTable({
        iris[colm()]
    })
    
    output$myhist <- renderPlot({
        hist(iris[,colm()], breaks=seq(0, max(iris[,colm()]), l=input$bins+1), col=input$color,
             main="Histogram of iris dataset", xlab=names(iris[colm()]), xlim=c(0,max(iris[,colm()])))
        
    })

})
