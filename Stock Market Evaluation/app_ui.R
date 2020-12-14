#Load your packages here
library(dplyr)
library(shiny)
library(plotly)

#Define UI widgets/variables here
tab1 <- tabPanel(
  strong("Introduction"), #The tab name
  includeCSS("style.css"),
  tags$h1("Covid in the Economy"),
  tags$h2("The Recent News"),
  tags$p("Since the start of the 21st century many events have taken place in America.
  Take this for example, the Great Recession had left Americans scrambling for any amount of income they could
  reach for in 2007 and it has only just ceased two years after it started. Now in 2020 the Covid 19 pandemic has come
    a long way from China to create a new recession in our country."),

  tags$h2("The Point"),
  tags$p("With so many events that have happened since the 2000s started, there comes the question about how these events
    affect businesses and their stocks. Between small and large businesses there needs to be an understanding that during
    a disasterous event smaller businesses will tend to be on the line of failure compared to larger businesses. In general,
    smaller businesses will require more help than large businesses, therefore large businesses should not be getting too much
    attention during those times as they will always be ready to spring back when the time is right, unlike smaller businesses."),

  tags$h2("Project Goals"),
  tags$p("With that said, the goal of this project will be to analyze the three most powerful technology companies in the US
     during harsh economical times in order to determine if they will spring back after this pandemic or if they stray from
     their history."),
  img(src = "https://images.assetsdelivery.com/compings_v2/bluebay/bluebay1511/bluebay151100019.jpg"),

  tags$h1("Data Collection Methods"),
  tags$p("The companies we've decided to choose for our project are ",a("Microsoft",href = "https://finance.yahoo.com/quote/MSFT/history?period1=1167609600&period2=1604793600&interval=1wk&filter=history&frequency=1wk&includeAdjustedClose=true")
    ,", ",a("Apple",href = "https://finance.yahoo.com/quote/AAPL/history?period1=1167609600&period2=1605052800&interval=1wk&filter=history&frequency=1wk&includeAdjustedClose=true"),
    ", and ",a("Amazon",href = "https://finance.yahoo.com/quote/AMZN/history?period1=1264032000&period2=1603238400&interval=1d&filter=history&frequency=1d&includeAdjustedClose=true"),
    ". The reason for this is because
     they are all reputable companies inside or related to the technology industry in some way.
     In order to gather our data for this project we've decided to use datasets from Yahoo Finances that were powered by one of
     America's biggest stock exchanges Nasdaq."),

  img(src = "https://cdn.iconscout.com/icon/free/png-256/microsoft-12-190755.png"),
  img(src = "https://pbs.twimg.com/profile_images/3394695612/318ea13ac09c55da5c19498b4ed97961.png"),
  img(src = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAA6lBMVEX///8AAAABAQH/mQD8/Px4eHj/mADz8/P/mwBAQED/nQDX19f29vbc3NwTExPw8PBRUVE7Ozu6urpsbGwsLCyQkJCWlpbBwcFYWFigoKDLy8sUFBRFRUUbGxuAgICIiIinp6ceHh7m5ua0tLRhYWEyMjJxcXFdXV0pKSmcnJw9PT3R0dH/+/P/8uFTU1P/9uf/u1j/4Lr/58v/yov/16n/zZb/rTn/tkz/v27/vFz/vnP/pRT/xn3/rEP/4ML/5r//3q//pDT/thL/0JH/2KD/rCb/uWD+xnP/oSD/u2X/7Nb/qTv/pgv/zIFG9S7JAAANW0lEQVR4nO1aCVviyhJNhxAgLGERWQQSwiIK7o6Ml5mr8wZ0hqv//++8Xqs7iKDO6Nz3vTp+snQ61XW6qquqO1gWAoFAIBAIBAKBQCAQCAQCgUAgEAgEAoFAIBAIBAKBQCAQCAQCgUAgEAgEAoFAIBAIBAKBQCAQCAQCgUC8K1K13WG/Xq/vV4Kev6GfY1l+bzcIGmOzNRtWg91e9Mw9zYNkf5+J7oTPddkMOqgV9Q6CoBo2HfH12Y6pMtXuoJxbaW5WRgWiUOj2Y+pb+f4xRyeiff1Kl3W191o1db3X2rPZfe16/umgUWenYCvRdrvYi18OSq11yFSypoJOo9XmCtqFkXmFoZnJiDuYdk5SaFcYBYadnPyhGJ7Yts3eKPpaVyeVVAqGllUmGkJIvm40VVf5qXu5aI4dc/p88hx2DQXD+CVzIh1rYNzR7OpeI7BALuTjM35cE/E/aJoMbQ7KsCd0lZ0Cav5sS2nPmzsx96gNiDFtNp9EUgi1m0UFKXsFJkO/IhUk6r3bMxw1IySQQsNqDojuBxRTVTkwQJAdqanmDMWVXn4AfTmfnhXtG6OzxoYxeLlA7JhsQdZQkDFcY0CTYVQnhoJCwl5DT2RGSig0/L7WjumSyQsLtoV7wuzZcqZaTpwh/W8k5RhqmtrOARCUTSW9TJpPDSR6Z7IvZxj1pWBDAKWo/UAxbB+E5mJgn6qsU3YgHROuSDo2NZATt6F9XIqrYZNgEDM/nwY1tnOoRNkx0fSlmjMYrkyv7CIZ+oGQavoJe+02Vxl2k/sylICQdor6aKAJdiudZEnqwRqOV73ULij7wnAFQmLK0fe+Lyk2JCl2U73TKSo1mRFV1liJNDAVdLGKDrU9Q8EdAuqRzBMvHejZUlLoNERKAJ1733GcXK8Lqo6iOEPbUAGiklZOiR1I7Z0WUZORjHJUdrYLS5hAPB0aIvYKeqC6CPZ8mYuWw3Eu54ddsGhD5kXFUGtHgAJ1hFARbFO6VAva0lad9mpchsmQ9qsEnZYRbdjU1pP9EdFNfH07Vrmr/LLKRTtW1AVB4bqsXRuAG6s4WIbovu+rPiqSx23ItbP7Ya/TVVRtUrGcvrJI4KjAcqwmgjpKjCET22LqO9UC0WIrrCmX1C0yjFSV6B1ZhTi5KgxdXcOQBk0woVyFubrMYaQ7FspYHTCSUA8YMq8rs4bxISS+luV0JJu2LjWG4IqNVYakneWGzvU1n37ECUTFVYaNrpRdhTKrDLd1ck8o5lRMoX91eTWCG5LChNQ1RitxIgPa2dQzmHohhLQBFRE2doPhfiupC8YOpOfdJwyTKTGRjYJy5a6KuAewUCVDvxceBMl+q6grkJpW+AlDp9eWxQFdH3lpsIYyITWYhH+o1N/JxrzUhlqnCY7blZPn57MqOtAZCGC57j5Zh2U5kU1YUYdqanqrDIXoKJvXojcxjDK6qJIO5VjgpML/OOoqqO2FMYYEXD/qq6a2OYUwYgBe+oShrZJQNFJNRXVbeR3DFdnN5xk6FUWGXVStBdWYgfRnJcGuHZOhsdKcofIwzVAM5497B50hVLJPGY6U8v6OaupvYyhE57LlRjBsKcmrDOnaUUGTugW4tU8Um+M89KzqEBCLNGQApXZSDbOnh0jVOsU2ieMpw4FSPgcMK9sYWs44OB6tSH5iw4iAj9pKUcew+X4EjSEIKUYxhi1IssCwoKaqBhsgo3RawxBqztRLGeaayYIhGsqCVRtmROrk2ROqPrq2VZLtR0ajGjszjjEswsArNkzVijC+VuL3MGwOSUz2ehs6TlWaj76BtXQoZcP40KhSDiGlZpwheHecoV8tKNNpBbYx9F/GMNwB0bYpetWGtZHaPZAdHVIca3cdQx2QxcLbxJB5qd8hcg/H+41KxZ0X2FAxJBsZHkjRQs1uqVVaH0tZMaNm2NzaM4ZkA8Od8gsY0kIKpo/Uw2Y2H23IFq+zYc+Yu+IBE91by5Dub2R5TWOmcURgeqmxDl9pw6YSzrzad8TEvdyGmxjmS8SWf6Oy2FGtz/i1AsRRYh7zOXJf8AxD8iKGbIcjl0c9kpXS72LYIaploIZeyzAqmcWMGYCoTMVw/yWxdB3DMaTUwVjWl2JP8OsMsxmi4n9N6b2GoZMaEjjZSjrxLJmH/pAJNuTDtQw7EEADWAAb6tLXMAxhbz2wVvrEbBgSMGFx9SjaAQMcqhBr1jSVeE2zlmFLuTQJQezQYGi9nWFVs1EmZOeeqwzzRG/8D8bjbBRjOVhTecPJHwms7QzbSoLeH+odsJTwNoa5JJhG7Q+dVEdHf8mQbXGVqELpMFPsJ3fDpq/spatsbYFjFRvb4QsYQoW2BwybA5ij4S8w9Cuyh2ZoRYfAMJMSTbtERUZdSxVK/V2prI6bsIryAzWOPBB6IUPSUFf1MpQr+dcY8i4yhvWADSFCm/xh/IQTDpczAR/b7yojttTQB+L5BYFtzWaGBVgEQ3kGKE96xGQ23s4QbuJplydapw0HcnQ81mD1uno0mFnRiR1bOE4Atg2FEHECzltr1gsiTUkvc3H61TwEf6GvfD/yxkgTyO8sCfAGp6vJ2Pwo04LTkFWORBWo+QKcdvLk5yeJYqgOTDczHOqzXRJk89ldccSvdBUT+cZsAbsmuqDH+XwYE22Tboqa4MBkaBgTSnCo6FiozWbLdSBIp8h5AUNIwZxoVw5uHPjW3sywWSLAhsY9+CTvs0kHTrTMnaP8BJuMbAb2/oaFbVseYWxlmBoAG/22J1RgH9kztjcy5IclUjlgJR4LiDFDaUNDeeCgt1FO2IX9JUwGO1eLXsZQ6GUr0ws3alakJUmrlnt7XTruEn1cII4O9g4CtRklvZxYh7xHoTWsNsJe2AgqLSlYbRRz+umfOmxk5Y9+zLplB5wLwM3lP5Wc7wqCxfxK1XZoMCTbGMp6TK1zmz8azYnnQ/whgiVDfztZzkc+KwEcJ+VH2V6F3QKPcHMiZumsabMjGV3Awlnb8SpDwvf4fkf5pGir5+EE6NiRdelQMYSTKH+kzBxnaJsM+cMnY5FxVhELOGyqHDkJo9A3y232OedT5vohtKi1VUhkb/vmDx5KiqF5TiObxElUrwTroHAoS5tam1c0srKC/RQ8QHfgQWJSSa1BFtUHf9kWxEq72xFtEV3mFdCw0bOe/raCfe/VjIZo34i59qAX69tXF+AcQFctsujP9ZL1Yqt43O+UVYlsNfsNLcVvVAX0Ccw42eHQv3hIhaKlo3/oQaXVOn0qurifDH1L7j+jfjVWXa97CuWsfhsH9cPBaLRTKlbClb7+rlBuVz89UAoHxqGY7/vrRvpFcJEpusaeaq16qNbJyRHDyWT1AvTM13q98th/TtJ2RZ5Vgrc7HK+WvF00w+T87PLi8/V0Oj39fHF5dvRCkXHtLGdz0x/Ecv7XdJZw3YTneWn6Njs9W9/xbXO8GUcX8/eehpMvX2duOp3QSKevJtvv+03425tNb951hNtvnstIeR63oKD48HEMT/6iY54u32+A2/88pBPej8XV9PR0evXD8z6aoTW58BKee798ryGPvs9vlif662M6Qdfj4gMZWtZ8QdfI7Mv5Bw26oFb0ph/K0Dq7chNpd/bl7GR731/HNWWYvv9Yhtb5nZtmHD9fbklUv4KTGyH81KN54/L9xlmPI7oYEy7lOL04f58Rlt/vFtdcNvfSdxplA5yzH5QijXLet7v5b/cg5/bnled63if2hWZG7+odfeVZHJ16PFe56YcfP3mG/F2VwPKe5ggazNwFE3vuUlx88DKUmH/zhB1p9pjdn09+gxaTyfJx4Xq8nvG+ctd8pIPM/v510W/C8vOMEeTOmnYX92d6H/AWnBz9/UijtEjxdM6ErK+U7t2fcFKByzsPikdKcnb96ez8TSnkZPn35edFwlXivLtbceGcrnfvwyOpgaNPV4k0N6PLK2TXu/pJdzuvqXgmR+eXn+heglnPFV6fvvqkrHbxkEhM/5wJKZzl91mCrxtX7gOoIRbTn1++394cbeM5Wd7ML/66u6I7JWMv4XmPS9gF39G90/y9SWzB5OTeS3M7ckvSyEdXEY2wi6uvd5To/OZ8dXlOTpY3t/PHz3df/1nMPM7OBTfw3GvDA84WCe/0oxmtwdE9D38umIFvf+hr2nt4mP2g+Hb1dSpwdfWNNcweHlitEr+NLebTpZl1LujVd9zIvAIn3/+ZJRLmrlWzdcUSTXvynzVJWq4b6zr79iW+5JZT13vf3egrMJnf0ToknXDXkFxpdFcahIt6i7v5ahy+9P74Iozh5uJukUivNeRm0HmZ3V2cPQ1Ml1//ZKJYh5OzT9c07L+KJKNH8+jajHDy71iDcdDsxlO3ZOm6a9wWGj3q14vPl+d/NOG9ATSHf79euK7nedqaLrwIy/FzwsX1/Hxr1vyXYjI5un3kh55pQdTl4NQYt/Ts9PH26HdU638aRzfzx/vTqUiCLC9OT+8f5zf/a26JQCAQCAQCgUAgEAgEAoFAIBAIBAKBQCAQCAQCgUAgEAgEAoFAIBAIBAKBQCAQCAQCgUAgEAgEAoFAIBD/9/gviBcTNcQLyaQAAAAASUVORK5CYII="),
  img(src = "https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/062016/untitled-1_79.png?itok=j9w8nuim")
  )

tab2 <- tabPanel(
  strong("Effects of the Great Recession of 2007-2009 on the Stock Market"), #The tab name
  includeCSS("style.css"),
  h1("Did Apple, Amazon, and Microsoft Benefit From The Great Recession
             of 2007-2008?"),
  # create choices for company data
  data_input <- radioButtons(
    "company_data",
    "Company",
    choices = c("Amazon", "Apple", "Microsoft", "All Three"),
    selected = "Amazon"),

  # create choices for y variable
  y_recession_input <- selectInput(
    "y_recession_var",
    label = "Y Variable",
    choices = colnames(recession_amazon),
    selected = "High"
  ),
  size_recession_input <- sliderInput(
    "recession_size",
    label = "Size of point", min = 0.1, max = 1, value = 0.5
  ),
  plotlyOutput("recessionPlot"),
  h2("Chart Analysis"),
  p("Given the choice of looking at Amazon, Apple, or Microsoft's stock data,
    it is easy to see the trends of stock prices during and after the Great
    Recession of 2007-2009. There is the option to choose a specific company, or
    all three at once. You can also change the y variable to display different
    variables such as the open and closing prices, the high and low prices for
    each day, and more. Throughout exploration of this chart, each of these companies
    suffered a massive dip in their stock prices at the end of this recession; however,
    they all had a steady recovery and managed to reach new highs as time increased.
    We will never know what would have ocurred if this recession had not happened,
    so it is impossible to tell whether or not this recession helped their stock
    prices, but they all recovered from the recession with flying colors. Microsoft
    is the oldest company of the three, and its stock prices reached the same prices
    as they were before the end of the recession, so from this we can conclude that
    the recession did not help Microsoft's stock prices, but it did not cause long
    term losses either.")
)

tab3 <- tabPanel(
  "Effects from the 2016 Election.", #The tab name
  includeCSS("style.css"),
  h1("During 2016, were there any effects from the 2016 election?"),

  Election_input <- sidebarPanel(
    selectInput("company_data",
    "Company",
    choices = c("Amazon", "Apple", "Microsoft"),
    selected= "Amazon")
    ),
  color_election_input <- selectInput(
    "election_color",
    label = "Color",
    choices = list("Red" = "red", "Blue" = "blue", "Green" = "green")
  ),
  plotlyOutput("electionplot"),
  p(""),
  p("When we are looking at these three companies of Amazon, Apple, and Microsoft
    our group was trying to think about what observations could be made to do about the datasets for 
    another visualization for our project. It turned out that we decided to look at another event that happened
    years after the Recession of 2007-08, the answer we came up with was the 2016
    Presidential Election between Democratic candidate Hillary Clinton and
    Republican Candidate Donald Trump. During this year tensions were high from
    the stock market heading into the election day, then when the night came when it was
    announced that Trump would win the presidency and be the 45th president of
    the United States of America. The only company of the three datasets that would be considered
    the biggest loss was Amazon, losing about 80 dollars after the
    second week of the election, but gaining its losses back in a matter of months.
    The saying goes, 'if ifs and buts were candy and nuts we would all have a merry christmas'
    well the 'if' remains: What would have happened if Hillary Clinton were to win the election
    as so many people were expecting it's hard to judge but for these big three markets,
    looking at present day of 2020 these three markets did fine after Trump's one and only
    term as president of the United States.")
  )





tab4 <- tabPanel(
  strong("COVID-19 Effects on the Stock Market"), #The tab name
  includeCSS("style.css"),

    h1("Question Statement"),
    p("The next question we are asking regarding our data is this: what effect
      did the COVID-19 pandemic have on our three companies. This question is
      important in a global context due to the the vast amounts of power these
      companies hold. We know that it is important to examine power, and if
      powerful corporations are benefiting from the pandemic, perhaps it would
      be reasonable to tax them more heavily, and use that money towards cure
      research, or towards relief packages for the many people displaced by the
      pandemic. "),
    fluidRow(
      column(8, offset = 2, align = 'center',
        h4(strong("Click on a row in the table to highlight it on the graph. Click
          the checkbox to highlight the days that California was under a
          shelter-in-place order."))
      )
    ),
  fluidRow(
    column(8, offset = 2,
      checkboxInput(inputId = "lockdowns",
        label = "Shade Lockdowns in California",
        value = FALSE),
      plotOutput("covidPlot", width = "90%"),
      align = 'center'
    )
  ),
  fluidRow(
    column(8, offset = 2,
      dataTableOutput("mainTable"),
      align = 'center'
    )
  ),
  h1("Conclusions"),
  p("From our data we can clearly see a positive correlation between COVID
  cases, and share price. Interestingly, if we isolate the prices during
  the California lockdowns, we observe the steepest upwards slope, indicating
   that lockdown periods seem to drive up share prices as well. This makes
   sense for a company like Amazon because people are forced to stay home
   during the pandemic, and so they are more likely to have things delivered.
    To summarize, all of our companies showed a positive correlation with the
    number of COVID-19 cases, which should lead us to view this data in context,
    and examine the people it affects negatively, such as Amazon warehouse workers.")

)

tab5 <- tabPanel(
  strong("Summary"), #The tab name
  includeCSS("style.css"),
  h1("In Summary"),
  h2("The Great Recession"),
  p("In this part of our analysis we compared our datasets during the time period of 2007 to 2009, which is known as 
     America's largest economic downfall, the Great Recession. Looking at the data for 'highs' in all three datasets, the 
    Great Recession hindered the progression of the stock data and slowed its growth. The struggle of each line is noticeable
    up until 2009 when the recession ends. What happens after this event is the
     key that should be paid attention to, and it is that all the datasets start rising quickly and while Amazon and Apple
    steadily grow, Microsoft stays in a consistent manner compared to the rest. With that said, it can be noted that these
    large companies, although having lost much during this recession, have all sprung back to life afterwards starting
    immediately after the recession ended, 2009."),
  img(src = "sum1.PNG"),
  img(src = "sum2.PNG"),
  img(src = "sum3.PNG"),
  h2("The 2016 Election"),
  p("Unlike the last analysis, instead of comparing our datasets to a disastrous event, we've decided to look at what happens
     when they are compared to a normal upscale event such as the 2016 elections to see if there are any noticeable changes
     to our stock data and what that says about the companies behind them. "),
  h2("The Covid 19 Pandemic"),
  p("In the case of our current pandemic and isolation, we decided that it was relevant to compare our datasets to the 
  current context of our society. During these times it is important to understand that not all businesses will be capable
    of thriving or even staying stable. Yet, within our three datasets, it is shown that not only are Amazon, Apple, and 
    Microsoft staying stable through this time, they are also growing steadily. Overall what can be said is that the 
    three large companies have managed to keep themselves well and will most likely keep growing as this pandemic
    drags on unless if some unforseen tragedies were to happen to them. Compared to smaller businesses that do not have all
    the resources to support their companies, they would not do as well as larger companies would, which brings the question
    of who and where should we be allocating our resources to the most?"),
  img(src = "sum5.PNG"),
  h1("Take Aways"),
  p("All in all, what can be said about large companies comes down to this: During any event, catastrophic or casual, whether
    they rise or fall or even stay steady, they will always come back after the event with full power and rise. What this
    whole analysis tells us about smaller companies on the other hand is that with larger companies being so flexible with their
    rise and falls of stocks, smaller companies may not have that kind of reaction these events, and will most likely be on the
    falling side. That is why we suggest that the focus during such events should not be allocating resources to larger
    more renouned companies, but rather the smaller businesses that are making significantly less than them.")
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
