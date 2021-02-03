library(shiny)


shinyUI(
    pageWithSidebar(
        headerPanel("Reto 1"),
        sidebarPanel(
            p("Crear plots con el DF 'iris'"), 
            selectInput("x", "Seleccione el valor de X",
                        choices = names(iris))
        ),
        
        mainPanel(
            
            #Agregando pestañas     # <-----------
            tabsetPanel(              # <-----------
              tabPanel("Plots",   #Pestaña de Plots  <-----------
                       h3(textOutput("output_text")), 
                       plotOutput("output_plot"),
              ),
              
              tabPanel("imágenes",  #Pestaña de imágenes <-----------
                       img( src = "cor_iris.png", 
                            width = 450)
              ), 
              
              #Aprovehamos y agregamos las siguientes pestañas # <-----------
              tabPanel("Summary", verbatimTextOutput("summary")),    # salida del Summary <-----------
              tabPanel("Table", tableOutput("table")),               # salida de la tabla <-----------
              tabPanel("Data Table", dataTableOutput("data_table"))   # salida del data table <-----------
            )
        )
    )
    
)