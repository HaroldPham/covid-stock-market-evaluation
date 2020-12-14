# covid-stock-market-evaluation
# Final Project

## Tasks:

### Domain of Interest:

Why are you interested in this field/domain?

  - It will be very informative to present stock market data from 2007 to 2020 because of the great recession in 2007 and our current pandemic state in 2020. We will be able to identify ways that companies deal with crises and their responses those times.

What other examples of data driven projects have you found related to this domain (share at least 3)?
  - http://www.cse.scu.edu/~mwang2/projects/Predict_stockMarket_16w.pdf
    - This project was a study done by three researchers at the Santa Clara University which seeks to use an algorithm named Support Vector	Machine	Algorithm	(SVM) in the hopes to read the predictability of the stock market changes throughout time.

  - https://github.com/ddm7018/PredictingTheDow
    - This project depicts the Dow Jones Industrial Average stock market index using Japanese candlestick graphs. The purpose of this project is to predict the dow jones stock based on popular new articles of the current day that explain the current direction of the stock market.
  - https://github.com/Quant-Projects/Recession-Prediction?files=1
    - This project was meant to predict the next recession, which is relevant to our topic because the stock market is directly related to the current economic situation. The model uses the current yield curve rate, as well as the current fear index price to attempt to forecast a recession in the coming months.

What data-driven questions do you hope to answer about this domain (share at least 3)?

  - How much do stock prices deviate when there isn’t a recession?
  - Which companies have benefited from the pandemic (based on their stock prices)?
  - Which companies have risen from the lows of the recession to higher now and vice versa.

### Finding Data:

In this section, you will identify and download at least 3 sources of data related to your domain of interest described above (into a folder you create called data/). You won't be required to use all of these sources, but it will give you practice discovering data.

Source Summaries:
Where did you download the data (e.g., a web URL)?
How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
How many observations (rows) are in your data?
How many features (columns) are in the data?
What questions (from above) can be answered using the data in this dataset?

  - https://finance.yahoo.com/quote/AAPL/history?period1=1167609600&period2=1605052800&interval=1wk&filter=history&frequency=1wk&includeAdjustedClose=true
    - Yahoo Finance takes the stock data from NasdaqGS, which is an American stock exchange.
    -  This data set has 724 observations of data.
    - This data set has 7 features of data.
    - This data set can be used to determine the stock price rate weekly up to current date for Apple, and using this data you can find answers to all the questions, the second and third question would require comparison with the other data sets.
  - https://finance.yahoo.com/quote/MSFT/history?period1=1167609600&period2=1604793600&interval=1wk&filter=history&frequency=1wk&includeAdjustedClose=true
    - Yahoo Finance takes the stock data from NasdaqGS, which is an American stock exchange.
    - This data set has 724 observations of data.
    - This data set has 7 features of data.
    - Likewise this data set can be used to determine the stock price rate weekly up to the current date for Samsung Electronics, and using this data you can find answers to all the questions as long as it is compared to the other data sets.
  - https://finance.yahoo.com/quote/AMZN/history?period1=1264032000&period2=1603238400&interval=1d&filter=history&frequency=1d&includeAdjustedClose=true
    - Yahoo Finance takes the stock data right off of NasdaqGS, an American stock exchange which is apparently second in the world of stock exchanges.
    - This data set has 721 observations of data.
    - This data set has 7 features of data.
    - Lastly, this data set for Amazon can also be used to compare stock prices up to current date with the other data sets to answer the questions stated above.
