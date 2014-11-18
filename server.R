library("shiny", lib.loc="~/R/win-library/3.1")
library(datasets)

# We tweak the "am" field to have nicer factor labels. Since this doesn't
# rely on any user inputs we can do this once at startup and then use the
# value throughout the lifetime of the application
tgData <- (ToothGrowth)
#tgData$supp <- factor(tgData$supp, labels = c("OJ", "VC"))

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {

  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    paste("len ~", input$variable)
  })

  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })

  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$tgPlot <- renderPlot({
      boxplot(as.formula(formulaText()), 
              data = tgData,
              outline = input$outliers)
  })
})
