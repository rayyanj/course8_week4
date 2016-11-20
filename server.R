#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw two sine waves and their superposition
shinyServer(function(input, output) {
   
  output$wavesPlot <- renderPlot({

    t_start = 0
    t_end = 1
    t = seq(t_start, t_end, 0.001)
    
    y1 <- input$a1 * sin(2*pi*input$f1 * t + pi*input$phi1)
    y2 <- input$a2 * sin(2*pi*input$f2 * t + pi*input$phi2)
    
    plot(t, y1, type="l", ylim = c(-10,10), col = "green", ylab = "y1, y2")
    lines(t, y2, col="orange")
  })
  
  output$sumPlot <- renderPlot({
    t_start = 0
    t_end = 1
    t = seq(t_start, t_end, 0.001)
    
    y1 <- input$a1 * sin(2*pi*input$f1 * t + pi*input$phi1)
    y2 <- input$a2 * sin(2*pi*input$f2 * t + pi*input$phi2)
    
    plot(t, y1 + y2, type="l", ylim = 20*c(-1,1), col = "blue")
  })
})
