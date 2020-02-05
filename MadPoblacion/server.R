
library(shiny)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
   output$area <- renderUI(
     selectInput("area", "Select Area to view plot by country", 
                 choices = areas)
   )
   
   output$anno <- renderUI(
     selectInput("anno", "Select Date to view top ten countries", 
                 choices = fechas)
   )
   
   output$plot1 <- renderPlot(g)
   
   h <- reactive({
     req(input$area)
     ia <- input$area
     ggplot(filter(d2, Area == ia),
            aes(fecha2, Num_habit,
                color = fct_reorder2(Pais, fecha2, Num_habit))) +
       geom_line() +
       scale_color_discrete(name = "Country") +
       labs(
         x = "Date",
         y = "Number of residents",
         title = "Number of Foreign Residents by Country",
         subtitle = paste("Selected Area:", input$area)
       )
   })

   output$plot2 <- renderPlot({
      h()
   })
   
   t <- reactive({
     req(input$anno)
     ian <- input$anno
     df <- as.data.frame(d2)
     df <- df[df$fecha2 == ian , c("Pais", "Num_habit")]
     names(df) <- c("Country", "Residents")
     dfh <- head(df[order(df$Residents, decreasing = TRUE), ], 10L)
     dfh$Rk <- 1:nrow(dfh)
     dfh <- dfh[, c("Rk", "Country", "Residents")]
   })

   output$fecha <- renderText({
     paste("Selected date: ", input$anno)
   })
   
   output$rk <- renderTable({
     t()
   })

}
