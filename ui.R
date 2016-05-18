library(shiny)

shinyUI(fluidPage(
  
  titlePanel(title = h1("Developing Data Products Final Assignment", align = "center")),

  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Reactive dataset:", c("InsectSprays" = "InsectSprays", "pressure" = "pressure")),
      sliderInput("obs", "Observations:", min = 3, max = 100, value = 10),
      radioButtons("color", "Color", c("Lightblue", "Yellow"), selected="Lightblue")
      ),
    mainPanel(
      h3(textOutput("caption", container = span)),
      tabsetPanel(type = "tabs", 
                  tabPanel("Plot",plotOutput("plot")),
                  tabPanel("Summary", verbatimTextOutput("summary")))
      )
    )
  )
)