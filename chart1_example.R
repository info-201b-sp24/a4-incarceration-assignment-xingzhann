library(ggplot2)

average_jails <- incarceration %>%
  group_by(year) %>%
  summarize(average_black_jails = mean(black_jail_pop_rate, na.rm = TRUE),
            average_white_jails = mean(white_jail_pop_rate, na.rm = TRUE))

colors <- c("Black" = "red", "White" = "green")

ggplot(average_jails, aes(x = year)) +
  geom_bar(aes(y = average_black_jails, fill = "Black"), stat = "identity") +
  geom_bar(aes(y = average_white_jails, fill = "White"), stat = "identity") +
  labs(x = "Year", y = "Average Jail Rate per 100K for US Counties", 
       title = "Average Jailed (per 100k per year) for people by US County") +
  scale_fill_manual(values = colors, name = "Race", labels = c("Black", "White"))
