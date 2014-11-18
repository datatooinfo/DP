library("shiny", lib.loc="~/R/win-library/3.1")
library(datasets)

# Read the Tooth Growth dataset
tgData <- (ToothGrowth)

# Define server logic required to plot variables against len
shinyServer(function(input, output) {

  # Compute the forumla text in a reactive expression.
  formulaText <- reactive({
      paste("len ~", input$variable)
  })

  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })

  # Generate a plot of the requested variable against len and only 
  # include outliers if requested
  output$tgPlot <- renderPlot({
      boxplot(as.formula(formulaText()), 
              data = tgData,
              outline = input$outliers)
  })
})
