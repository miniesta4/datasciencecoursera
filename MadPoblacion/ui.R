
library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Foreign-born residents in the city of Madrid"),
    
    sidebarLayout(
      sidebarPanel(
        uiOutput("area"),
        helpText("Note: Only countries over a minimum of residents are provided",
                 "in the original dataset. The second graphic is updated on selection.",
                 "The first graphic is always kept as a reference."),
        br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(),
        br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(),
        br(), br(), br(), br(), br(), br(), br(), br(), br(),
        uiOutput("anno"),
        helpText("Note: The time series has a period of six months",
                 "so the frequency has a value of 2 per year.")
      ),
      
      mainPanel(
        p("Time series from 2011 to 2019."),
        plotOutput("plot1"),
        plotOutput("plot2"),
        p("Time series from 2011 to 2019."),
        tableOutput("rk")
      )
    )
  ))