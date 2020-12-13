library('tidyverse')
library('showtext')
library('DT')
font_add_google(name = 'Roboto Mono', family = "roboto")
showtext_auto()

amazon <- read.csv("data/AMZN.csv") %>% mutate(Date = as.Date(Date))
apple  <- read.csv("data/AAPL.csv") %>% mutate(Date = as.Date(Date))
msoft <- read.csv("data/MSFT.csv") %>% mutate(Date = as.Date(Date))
covid <- read.csv("data/COVID.csv") %>% mutate(Date = as.Date(date)) %>% select(Date, cases, deaths)


amazoncombined <- inner_join(covid, select(amazon, Close, Date), by = "Date") %>% mutate(company = "Amazon")
msoftcombined <- inner_join(covid, select(msoft, Close, Date), by = "Date") %>% mutate(company = "Microsoft")
applecombined <- inner_join(covid, select(apple, Close, Date), by = "Date") %>% mutate(company = "Apple")

combined  <- bind_rows(amazoncombined, msoftcombined, applecombined)

displayTable <- combined %>%
  mutate(appleprice = ifelse(company == "Apple", Close, NA), amazonprice = ifelse(company == "Amazon", Close, NA), microsoftprice = ifelse(company == "Microsoft", Close, NA) ) %>%
  group_by(Date) %>%
  summarise(Cases = cases, Apple = sum(appleprice, na.rm = TRUE), Amazon = sum(amazonprice, na.rm = TRUE), Microsoft = sum(microsoftprice, na.rm = TRUE)) %>%
  distinct()


chart2 <- (ggplot(data = combined) +
  geom_point(aes(x = cases, y = Close, color = company), size = 2.5) +
  geom_smooth(method = 'lm', aes(x = cases, y = Close, color = company), se = FALSE) +
  facet_grid(company~., scales = "free") +
  ggtitle("Closing Price per Share vs COVID-19 Cases per day") +
  theme_minimal() +
  ylab("Closing Price($)") + xlab("COVID-19 Cases") +
  scale_y_continuous(labels= scales::dollar_format()) +
  scale_x_continuous(labels = scales::comma) +
  theme(axis.line.x = element_line(size = 1.25, linetype = "solid"),
    panel.grid.major = element_line(color = "#c7c7c7"),
    panel.background = element_rect(fill = '#ffefd5', color = '#ffefd5'),
    plot.background = element_rect(fill = '#ffefd5', color = '#ffefd5'),
    text = element_text(family = "roboto",face = "bold"))
)
