library(shiny)

# Global variables can go here
n <- 200


# Define the UI
ui <- bootstrapPage(
  h1("Joe Ledford"),
  numericInput('n', 'Number of obs', n),
  plotOutput('plot')
)


# Define the server code
server <- function(input, output) {
  output$plot <- renderPlot({
    boxplot(runif(input$n), col="red")
  })
}

# Return a Shiny app object
shinyApp(ui = ui, server = server)