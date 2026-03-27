# Joe Ledford

library(shiny)

# Global variables
n <- 200

# Define the UI
ui <- bootstrapPage(
  h1("Joe Ledford"),
  
  numericInput(
    inputId = "n",
    label = "Number of observations",
    value = n
  ),
  
  selectInput(
    inputId = "plot_type",
    label = "Select Plot Type",
    choices = c("Histogram", "Boxplot"),
    selected = "Histogram"
  ),
  
  selectInput(
    inputId = "plot_color",
    label = "Select Plot Color",
    choices = c("Black" = "black", "Red" = "red", "Blue" = "blue", "Green" = "green"),
    selected = "black"
  ),
  
  plotOutput("plot")
)

# Define the server code
server <- function(input, output) {
  output$plot <- renderPlot({
    data <- runif(input$n)
    
    if (input$plot_type == "Histogram") {
      hist(data, col = input$plot_color, main = "Histogram", xlab = "Value")
    } else {
      boxplot(data, col = input$plot_color, main = "Boxplot")
    }
  })
}

# Return a Shiny app object
shinyApp(ui = ui, server = server)