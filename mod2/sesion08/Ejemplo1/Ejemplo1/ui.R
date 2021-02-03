library(shiny)

shinyUI(
 pageWithSidebar(
     
     headerPanel("Aplicación simple con Shiny"),
     sidebarPanel(
         p("Vamosa a crear plots con el dataset de `mtcars`"),
         selectInput("x", "Seleccione el eje de las X", # Se indica que la variable "x" será la de entrada
                     choices = colnames(mtcars)) # Sirve para desplegar las variables a graficar en este caso son todas las de mtcars
     ),
     mainPanel(
         h3(textOutput("output_text")),
         plotOutput("output_plot")
     )
     
 )
)