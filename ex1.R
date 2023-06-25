# cada região de uma cor


# WHO_REGION e PERSONS_LAST_DOSE - Cumulative number of persons vaccinated with a complete primary series

grafico <- df1 %>%
  ggplot(aes(x = WHO_REGION, y = PERSONS_VACCINATED_1PLUS_DOSE_PER100, fill= WHO_REGION)) + 
  geom_bar(stat = "identity") +
  theme_classic() +
  labs(x = "WHO regional offices",
       y = "Cumulative persons vaccinated with at least one dose (per 100 population)")
grafico
grafico + theme(axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), axis.text = element_text(size = 8))
