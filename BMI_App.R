#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

###### Q4 ######

library('shiny')

ui <- fluidPage(
  titlePanel("BMI Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("weight", "Enter Weight (kg):", ""),
      textInput("height", "Enter Height (m):", ""),
      actionButton("calculate", "Calculate BMI"),
      hr(),
      h4("BMI Result:"),
      textOutput("bmi"),
      h4("BMI Interpretation:"),
      textOutput("interpretation")
    ),
    
    mainPanel()
  )
)

server <- function(input, output) {
  observeEvent(input$calculate, {
    
    weight <- as.numeric(input$weight)
    height <- as.numeric(input$height)
    
    if (is.na(weight) || is.na(height) || weight <= 0 || height <= 0) {
      output$bmi <- renderText("Invalid input. Please enter valid values.")
      output$interpretation <- renderText("")
    } else {
      
      bmi <- weight / (height^2)
      
      output$bmi <- renderText(paste("Your BMI is:", round(bmi, 2)))
      
      interpretation <- ifelse(bmi < 18.5, "Underweight",
                               ifelse(bmi < 24.9, "Normal Weight",
                                      ifelse(bmi < 29.9, "Overweight", "Obese")))
      
      output$interpretation <- renderText(paste("BMI Interpretation:", interpretation))
    }
  })
}

shinyApp(ui = ui, server = server)

