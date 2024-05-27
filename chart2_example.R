library(ggplot2)
library(dbplyr)

average_native_jails <- wa_incarceration %>%
  group_by(year) %>%
  summarize(average_native_jails = mean(native_jail_pop_rate, na.rm = TRUE))

ggplot(average_native_jails, aes(x = year, y = average_native_jails)) +
  geom_point(color = "blue") +
  labs(x = "Year", y = "Average Jail Rate per 100K", 
       title = "Average Jail Rate (per 100k per year) for Natives 
       by WA State County")