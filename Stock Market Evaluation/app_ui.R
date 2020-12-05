#Load your packages here
library(shiny)

#Define UI widgets/variables here
tab1 <- tabPanel(
  "Introduction", #The tab name
  h1("The Recent News"),
  p("Since the start of the 21st century many things have happened. Take this for example, the Great Recession had 
  left Americans scrambling for any amount of income they could reach for in 2007 and it has only just ceased two years after
  it started. Now in 2020 the Covid 19 pandemic has come a long way from China to create a new recession in our country."),
  h1("The Point"),
  p("With so many events that have happened since the 2000s started, there comes the question about how these events
    affect businesses and their stocks. Between small and large businesses there needs to be an understanding that during
    a disasterous event smaller businesses will tend to be on the line of failure compared to larger businesses. In general,
    smaller businesses will require more help than large businesses, therefore large businesses should not be getting too much
    during those times as they will alway sbe ready to spring back when the time is right, unlike smaller businesses."),
  h1("Project Goals"),
  p("With that said, the goal of this project will be to analze the top three most powerful technology companies in the US
     during harsh economical times in order to determine if they always spring back after every event.")
  
  )
tab2 <- tabPanel(
  "Interactive Data 1", #The tab name
  
)

tab3 <- tabPanel(
  "Interactive Data 2", #The tab name
  
)

tab4 <- tabPanel(
  "Interactive Data 3", #The tab name
  
)

tab5 <- tabPanel(
  "Summary", #The tab name
  
)

#The UI Display Section (Add widgets/variables here)
ui <- navbarPage(
  "Covid Stock Market Evaluation", 
  tab1,
  tab2,
  tab3,
  tab4,
  tab5
)