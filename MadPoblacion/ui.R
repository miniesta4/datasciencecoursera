
library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Foreign-born residents in the city of Madrid"),
    
    sidebarLayout(
      sidebarPanel(
        uiOutput("area"),
        helpText(
          "Note: The data source only includes countries whose \
          number of residents exceeds a certain minimum. The first \
          plot is always shown as a reference. The second is updated."
        ), 
        br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(),
        br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(),
        br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(),
        uiOutput("anno"),
        helpText("Note: The time series has a period of six months \
                 so the frequency has a value of 2 per year.")
      ),
      
      mainPanel(
        tags$a(href = "http://www-2.munimadrid.es/CSE6/jsps/menuBancoDatos.jsp",
               "Source: Ayuntamiento de Madrid", target = "_blank"),
        h3("Time series from 2011 to 2019"),
        plotOutput("plot1"),
        plotOutput("plot2"),
        h3("Ranking by country"),
        textOutput("fecha"),
        tableOutput("rk")
      )
    )
  ))