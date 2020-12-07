library(dplyr)
library(shiny)
library(plotly)

# render csv data files
amazon <- read.csv("../data/AMZN.csv")
apple  <- read.csv("../data/AAPL.csv")
msoft <- read.csv("../data/MSFT.csv")

# fix dates in files
apple <- apple %>% mutate(Date = as.Date(Date), Company = "Apple")
msoft <- msoft %>% mutate(Date = as.Date(Date), Company = "Microsoft")
amazon <- amazon %>% mutate(Date = as.Date(Date), Company = "Amazon")

## tab2: recession data interactive tab
# select data from during and 3 years after recession (2007-2012)
recession_apple <- apple %>% 
  filter(Date <= "2012-12-31")
recession_msoft <- msoft %>% 
  filter(Date <= "2012-12-31")
recession_amazon <- amazon %>% 
  filter(Date <= "2012-12-31")


server <- function(input, output) {
  # Recession tab 2 plots
  output$recessionPlot <- renderPlotly ({
    # Store the title of the graph in a variable indicating the x/y variables
    title <- paste0("Stock Market Dataset:", " Time v.s. ", input$y_recession_var)
    
    # Recession plots
    if (input$company_data == "Amazon") {
      # Create amazon ggplot
      amazon_plot <- ggplot(recession_amazon) +
        geom_point(mapping = aes_string(x = recession_amazon$Date, y = input$y_recession_var), 
                   size = input$recession_size, 
                   color = input$recession_color) +
        aes(text = paste("Company:", Company)) +
        labs(x = "Year", y = input$y_recession_var, title = title)
      ggplotly(amazon_plot)
    } else if (input$company_data == "Apple") {
      # Create apple ggplot
      apple_plot <- ggplot(recession_apple) +
        geom_point(mapping = aes_string(x = recession_apple$Date, y = input$y_recession_var), 
                   size = input$recession_size, 
                   color = input$recession_color) +
        aes(text = paste("Company:", Company)) +
        labs(x = "Year", y = input$y_recession_var, title = title)
      ggplotly(apple_plot)
    } else {
      # Create microsoft ggplot
      microsoft_plot <- ggplot(recession_msoft) +
        geom_point(mapping = aes_string(x = recession_msoft$Date, y = input$y_recession_var), 
                   size = input$recession_size, 
                   color = input$recession_color) +
        aes(text = paste("Company:", Company)) +
        labs(x = "Year", y = input$y_recession_var, title = title)
      ggplotly(microsoft_plot)
    }
  })
}
  
  