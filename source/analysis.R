
library(tidyverse)
library(dplyr)
library(ggplot2)

rm(list = ls())

county <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv", stringsAsFactors = FALSE)

jurisdiction <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends_jail_jurisdiction.csv", stringsAsFactors = FALSE)

trends <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv", stringsAsFactors = FALSE)

# Value 1. find the population of blacks in 2013

black_year <- county[c("year" , "black_jail_pop")]

class(black_year$year)

black_2013 <- black_year[black_year$year == "2013", ]

black_total <- sum(black_2013, na.rm = TRUE)

# Value 2. find the population of whites in 2013

white_year <- county[c("year" , "white_jail_pop")]

class(white_year$year)

white_2013 <- white_year[white_year$year == "2013", ]

white_total <- sum(white_2013, na.rm = TRUE)

# combines the black and white population datasets for 2013

bw_total <- merge(black_2013, white_2013, by = "year")

# Value 3. show a ratio for bw_total that compares black and white populations

bw_total %>% mutate(r = black_pop_15to64/white_pop_15to64)

# Value 4. find the county with the highest population of blacks

county_highest_black <- county[which.max(county$black_jail_pop) , ]

# Value 5. find the county with the lowest population of blacks

county_lowest_black <- county[which.min(county$black_jail_pop) , ]

county_highest_black$black_jail_pop

county_lowest_black$black_jail_pop

# find the black population in 2005

black_year <- county[c("year" , "black_jail_pop")]

class(black_year$year)

black_2005 <- black_year[black_year$year == "2005", ]

black_total_2005 <- sum(black_2005, na.rm = TRUE)

# find the difference between the population of blacks in 2005 to 2013

black_total - black_total_2005

# find the trend of the black population in jails over the years for Los Angeles County

# create a data frame for the black population in jail in Los Angeles County over the years

los_angeles_bl <- trends[c("year", "state", "county_name", "black_jail_pop")]

los_angeles_bl <- los_angeles_bl[los_angeles_bl$county_name == "Los Angeles County", ]

# create a data frame for the white population in jail in Los Angeles County over the years

los_angeles_w <- trends[c("year", "state", "county_name", "white_jail_pop")]

los_angeles_w <- los_angeles_w[los_angeles_w$county_name == "Los Angeles County", ]

# merge the white and black population in LA data sets

los_angeles_bw <- merge(los_angeles_bl, los_angeles_w, by = c("year", "state", "county_name"))

# Trends Over Time Chart
# create a line plot that shows the population of blacks and whites in the Los Angeles County jail over the years
# demonstrates the population trend over time

g1 <- ggplot(los_angeles_bw, aes(year)) +
  geom_line(aes(y = black_jail_pop, color = "red")) +
  geom_line(aes(y = white_jail_pop, color = "blue"))
print(g1)

g1 +
  xlab("Time in Years") +
  ylab("Population of Blacks and Whites in L.A. Jails") +
  labs(title = 'Population of Blacks vs Population of Whites in L.A. Jails over the Years', subtitle = 'Years: 1970 - 2018') +
  labs(color = "Population in Jail") +
  scale_color_manual(labels = c("black population", "white population"),
                     values = c("red", "blue"))

# Variable Comparison Chart

# shows the frequency of the black population in jail systems
# compares the population number of blacks and the frequency they appear in in jail systems

hist(black_year$black_jail_pop, main = "Frequency of Black Populations in Jail Systems",
     col = rgb(1, 0, 0, 0.5),
     xlab = "Number of Population of Blacks in Jail Systems",
     xlim = c(0, 10000),
     ylim = c(0, 10000))

# Map

install.packages("usmap")
library(usmap)

US_bl <- county[c("state", "black_jail_pop")]

US_bl <- US_bl %>% filter(! is.na(US_bl$black_jail_pop))

US_bl <- US_bl %>% group_by(state) %>% summarise_each(funs(max)) 

# https://cran.r-project.org/web/packages/usmap/vignettes/mapping.html

plot_usmap(data = US_bl, values = "black_jail_pop", color = "white") +
  scale_fill_continuous(name = "Population of Blacks in U.S. Jails", label = scales::comma) +
  labs(title = "Black Population in U.S. Jails per State",
       subtitle = "Density of black population in jails per U.S. state") +
  theme(legend.position = "right")

# https://www.infoworld.com/article/3404276/how-to-calculate-month-over-month-changes-in-r.html
# https://www.statmethods.net/management/merging.html
# https://stackoverflow.com/questions/10085806/extracting-specific-columns-from-a-data-frame
# https://www.youtube.com/watch?v=Xau4LRpuoVk
# https://www.youtube.com/watch?v=7yTi33wvbIM
# https://www.youtube.com/watch?v=51BC41pMZEo
# https://www.youtube.com/watch?v=oA49kPqau-o
# https://stackoverflow.com/questions/41060599/how-to-combine-duplicate-rows-in-a-data-frame-in-r
# https://cran.r-project.org/web/packages/usmap/vignettes/mapping.html
# https://www.youtube.com/watch?v=AgWgPSZ7Gp0





