# load in libraries
library(dplyr)

# load in data sets
wa_incarceration <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-prison-jail-rates-1990-WA.csv")
incarceration <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates-1990.csv?raw=true")
View(wa_incarceration)
View(incarceration)

# Summary Information
# What is the average(of US counties) jail rate of Black individuals during 1990?

average_black_jail_1990 <- incarceration %>%
  filter(year == 1990) %>%
  summarise(average_black_jail_1990_rate = mean(black_jail_pop_rate, na.rm = TRUE)) %>%
  pull(average_black_jail_1990_rate)

average_black_jail_1990

# What is the average(of US counties) jail rate of Black individuals during 2018?

average_black_jail_2018 <- incarceration %>%
  filter(year == 2018) %>%
  summarise(average_black_jail_2018_rate = mean(black_jail_pop_rate, na.rm = TRUE)) %>%
  pull(average_black_jail_2018_rate)

average_black_jail_2018

# What is the average(of US counties) jail rate of Native individuals during 2018?

average_native_jail_2018 <- incarceration %>%
  filter(year == 2018) %>%
  summarise(average_native_jail_2018_rate = mean(native_jail_pop_rate, na.rm = TRUE)) %>%
  pull(average_native_jail_2018_rate)

average_native_jail_2018

# What is the average(of US counties) jail rate of White individuals during 2018?

average_white_jail_2018 <- incarceration %>%
  filter(year == 2018) %>%
  summarise(average_white_jail_2018_rate = mean(white_jail_pop_rate, na.rm = TRUE)) %>%
  pull(average_white_jail_2018_rate)

average_white_jail_2018

# What year has the highest jail rate for Black individuals?

year_highest_black_jail_rate <- incarceration %>%
  group_by(year) %>%
  summarize(total_black_prison_pop_rate = sum(black_prison_pop_rate, na.rm = TRUE)) %>%
  filter(total_black_prison_pop_rate == max(total_black_prison_pop_rate)) %>%
  pull(year)

year_highest_black_jail_rate