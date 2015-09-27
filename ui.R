library(shiny)

shinyUI(fluidPage(
  ## Extends Shiny's stockVis demo
  
  titlePanel("Stock Chart"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Enter a stock ticker to evaluate:"),
      textInput("symb", "Symbol [Company 1]", "AAPL"),
      ## Create text input box that accepts stock tickers 
      
      submitButton(text="Submit"),
      
      br(),
      
      helpText("Enter a stock ticker to compare:"),
      textInput("comp", "Symbol [Company 2]", "MSFT"),
      ## Create text input box that accepts another stock ticker for comparison
      
      submitButton(text="Submit"),
      
      br(),

      helpText("Choose a date range to evaluate:"),
      dateRangeInput("dates", "Date range", start = "2005-01-01", end = as.character(Sys.Date())),
      ## Create date input box to establish range of stock price to display

      h3("Trade Calculator"), 
      helpText("Simulate trading costs, revenue and gains/losses"),
      ## Calculates the gain/loss earned if stock were to be purchased/sold
      
      numericInput("shares", "Shares", NA),
      ## Create numeric input box for the quantity of stock shares to purchase/sell
      
      numericInput("price1", "Purchase Price", NA),
      ## Create numeric input box for the purchase price of stock 
      
      numericInput("price2", "Sell Price", NA),
      ## Create numeric input box for the sale price of stock
      
      submitButton(text="Submit"),
      
      helpText("Purchase Price:"),
      textOutput("purch"),
      ## Displays calculated purchase price of total stocks 
      
      helpText("Selling Price:"),
      textOutput("sale"),
      ## Displays calculated sale price of total stocks 
      
      helpText("Gain/Loss:"),
      textOutput("result")
      ## Displays calculated gain or loss if applicable 
    ),
    
    mainPanel(
      plotOutput("plot"),
      ## Displays chart for primary stock
      
      br(),
      
      plotOutput("plot2")
      ## Displays chart for comparison stock
    )
  )
))