#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
library(readr)
Mean <- read.csv("data_w6/100_104career_mean.csv",header = TRUE)
X <- as.factor(Mean$X)

# Define UI for application that draws a histogram

ui <-fluidPage(    
  
  # Give the page a title
  titlePanel("Salary mean by year"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("cate", "行業別:", 
                  choices= colnames(Mean[2:8]) ,
                  selected = "所有行業"),
      hr(),
      helpText("Data from AT&T (1961) The World's Telephones.")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("meanPlot")  
    )
    
  )
)

# Define server function required to create the scatterplot
server <- function(input, output) {
  
  # Fill in the spot we created for a plot
  output$meanPlot <- renderPlot({
    
    # Render a barplot
    barplot(Mean[,input$cate], 
            main=input$cate,
            names.arg = c("100","101","102","103","104"),
            ylab="count",
            xlab="Year",
            col=rainbow(5))
  })
}
# Create a Shiny app object
shinyApp(ui = ui, server = server)
