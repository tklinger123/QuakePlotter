
library(shiny)
library(ggplot2)

dataset <- quakes

shinyUI(pageWithSidebar(
    
    headerPanel("Earthquakes in the Fiji Region"),

    
    sidebarPanel(
        
         sliderInput('sampleSize', 'Sample Size', min=10, max=nrow(dataset),
                    value=min(10, nrow(dataset)), step=5, round=0),
        
        selectInput('x', 'X', names(dataset), names(dataset)[[2]]),
        selectInput('y', 'Y', names(dataset)),
        selectInput('color', 'Color', c('None', names(dataset))),
                                                        
        checkboxInput('smooth', 'Smooth'),
                                                                          
        selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
        selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
                 ),
                                                                                      
    mainPanel(
        
      plotOutput('plot')
              )
))
