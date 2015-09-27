library(quantmod)

shinyServer(function(input, output) {
  
  Data <- reactive({  
    ## Download financial data, based on user defined stock symbol and date range, from Yahoo Finance  
    getSymbols(input$symb, src = "yahoo", from = input$dates[1], to = input$dates[2], auto.assign = FALSE)
  })
  
  Comparison <- reactive({
    ## Download financial data, based on user defined stock symbol and date range, from Yahoo Finance 
    getSymbols(input$comp, src = "yahoo", from = input$dates[1], to = input$dates[2], auto.assign = FALSE)
  })
  
  output$plot <- renderPlot({
    ## Displays output of primary stock
    chartSeries(Data())
  })
  
  output$plot2 <- renderPlot({
    ## Displays output of comparison stock
    chartSeries(Comparison())
  })
  
  output$purch <- renderText({
    ## Displays total purchase price of stock
    input$shares * input$price1
  })
  
  output$sale <- renderText({
    ## Displays total selling price of stock
    input$shares * input$price2
  })
  
  output$result <- renderText({
    ## Displays total gain/loss from of stock sale if applicable
    (input$shares * input$price2) - (input$shares * input$price1)
  })
})