library(usmap)
library(dplyr)
library(ggplot2)

data_2018 <- incarceration %>%
  filter(year == 2018)

state_data <- data_2018 %>%
  group_by(state) %>%
  summarize(mean_black_incarceration_rate = mean(black_jail_pop_rate, na.rm = TRUE))

plot_usmap(data = state_data, values = "mean_black_incarceration_rate", 
           labels = TRUE) +
  scale_fill_continuous(name = "Incarcerations(Jailed) per 100k", label = scales::comma) +
  ggtitle("2018 Black Jail Rates per 100K(per state by state county mean)") +
  theme(legend.position = "right") +
  coord_sf()
