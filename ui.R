#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws two sine waves and their superposition
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Week 4 Assignment - Superposition of Waves"),
  
  h4("by Rayyan Jaber - Nov 19, 2016"),
  
  div("Waves are all around us. Sound propagates in waves. Light propagates in a wave.
      This application demonstrates the principle of superposition of two sinusoidal waves."),
  
  div("Each sin wave is characteried by its amplitude, frequency, and phase.
      Use the sliders to the left to construct two waves (green and red) by selecting the amplitude, frequency and phase 
      for each wave. Tweak those parameters and inspect their effect on the waves shown on the top plot."),
  
  div("The bottom plot shows the effect of the two waves when they are combined (superposed), 
      a phenomenon physists refer to as interference. Tweak the different parameters of each wave and observe their effect
      on the resulting combined wave in the bottom plot."),
  
  div("Try setting the two waves to the same frequency, set the phase of the first wave to 0,
       and tweak the phase of the second wave. At which phase does the resulting
       combined wave have the largest amplitude? smallest amplitude?"),

  sidebarLayout(
    sidebarPanel(
       sliderInput("a1",
                   "amplitude of wave 1:",
                   min = 0,
                   max = 10,
                   value = 5, step = 0.1),
       sliderInput("f1",
                   "frequency of wave 1:",
                   min = 1,
                   max = 10,
                   value = 5, step = 0.1),
       sliderInput("phi1",
                   "Phase of wave 1 (as multiple of pi):",
                   min = 0,
                   max = 2,
                   value = 0, step = 0.01),
         
       sliderInput("a2",
                   "amplitude of wave 2:",
                   min = 0,
                   max = 10,
                   value = 5, step = 0.1),
       sliderInput("f2",
                   "frequency of wave 2:",
                   min = 1,
                   max = 10,
                   value = 5, step = 0.1),
       sliderInput("phi2",
                   "Phase of wave 2 (as multiple of pi):",
                   min = 0,
                   max = 2,
                   value = 0.5, step = 0.01)       
           ),
    
    # Show a plot of the waves and their superposition
    mainPanel(
      fluidRow(
        column(8, plotOutput("wavesPlot", height = 300)),
        column(8, plotOutput("sumPlot", height = 300)))
    )
  )
))
