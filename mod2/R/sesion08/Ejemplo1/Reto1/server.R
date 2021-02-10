library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$output_text <- renderText(input$x)   #Titulo del main Panel
    
    #Gráficas                       <----------
    output$output_plot <- renderPlot( plot(iris[, input$x]))
    
    #imprimiendo el summary       <----------                                  
    output$summary <- renderPrint({
        summary(iris)
    })
    
    # Agregando el dataframe       <----------
    output$table <- renderTable({ 
        data.frame(iris)
    })
    
    #Agregando el data table       <----------
    output$data_table <- renderDataTable({iris}, 
                                         options = list(aLengthMenu = c(5,25,50),
                                                        iDisplayLength = 5))

})
