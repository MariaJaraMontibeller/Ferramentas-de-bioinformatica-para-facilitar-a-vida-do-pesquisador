# cada região de uma cor


grafico <- df2 %>%
  ggplot(aes(x = COUNTRY, y = PERSONS_LAST_DOSE_PER100)) + 
  geom_bar(stat = "identity") +
  scale_y_continuous(limits = c(0, 100)) +
  theme_classic() +
  labs(x = "Regional Office for the Eastern Mediterranean ",
       y = "Last dose (per 100 population)")
grafico
grafico + theme(axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), axis.text = element_text(size = 8))



ggsave(filename = "Figura2.png", grafico,
       width = 10, height = 7, dpi = 500, units = "in", device='png')
