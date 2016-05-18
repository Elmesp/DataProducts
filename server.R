library(shiny)
library(datasets)

shinyServer(function(input, output) {
  
  datasetInput <- reactive({
    switch(input$dataset,
           "pressure" = pressure,
           "InsectSprays" = InsectSprays)
  })
  output$summary <-renderText({
    paste("This app allows to select a dataset for chart reviewing. The app can:

- Select a dataset
- Change colors of the histogram
- Change the number of observations

All controls are reactive.
It includes a summary tab where you can read this instructions.")
  })
  
  output$plot <- renderPlot({
    dataset <- datasetInput()
    hist(dataset[,1],breaks=seq(0,as.integer(max(dataset[,1])),l=input$obs),col=input$color,xlab=names(dataset[1]))
  })
})