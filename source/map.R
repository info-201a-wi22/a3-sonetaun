library(tidyverse)
library(dplyr)
library(ggplot2)

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