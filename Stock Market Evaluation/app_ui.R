#Load your packages here
library(shiny)

#Define UI widgets/variables here
tab1 <- tabPanel(
  "Introduction", #The tab name
  
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
  "Summary and Conclusion", #The tab name
  
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