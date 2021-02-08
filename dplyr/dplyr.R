library(gapminder)
library(dplyr)
gapminder <- as_tibble(gapminder)


head(gapminder)
tail(gapminder)
dim(gapminder)
names(gapminder)
summary(gapminder)
str(gapminder)

# Select
select(gapminder, country, year)
select(gapminder, -pop)    
select(gapminder, contains("c"))
select(gapminder, contains("c"), contains('g'))
select(gapminder, starts_with('c'))
select(gapminder, ends_with('p'))

# Filter 
filter(gapminder, country == "Bangladesh")
filter(gapminder, pop > 5000000)
filter(gapminder, gdpPercap > 800)
filter(gapminder, country == "Bangladesh" & gdpPercap < 800)
filter(gapminder, country=="Bangladesh" | country == "Australia")
filter(gapminder, country %in% c("Bangladesh", "Australia"))
