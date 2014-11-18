library("shiny", lib.loc="~/R/win-library/3.1")

# Define UI for the Tooth Growth application
shinyUI(pageWithSidebar(

  # Application title
  headerPanel(h6("Tooth Growth data set: Click the arrow in the dropdown menu to dtermine
average tooth growth against the type of supplement
and dose.")),

  # Sidebar with controls to select the variable to plot against len
  # and to specify whether outliers should be included
  sidebarPanel(
    selectInput("variable", "Variable:",
                list("Supplement" = "supp", 
                     "Dose" = "dose")),
    

    checkboxInput("outliers", "Show outliers", FALSE)
  ),
  

  # Show the caption and plot of the requested variable against len
  mainPanel(
    h3(textOutput("caption")),

    plotOutput("tgPlot")
  )
))
