### number of exams
# https://acervolima.com/modifique-o-eixo-a-legenda-e-os-rotulos-do-grafico-usando-ggplot2-em-r/

library(tidyverse)
library(ggplot2)

df1 <- read.csv(file = "/Users/mjara/Downloads/vaccination-data.csv" , header = TRUE, sep = ",")

head(df1)

df1

# WHO_REGION e PERSONS_LAST_DOSE - Cumulative number of persons vaccinated with a complete primary series

grafico <- df1 %>%
  ggplot(aes(x = WHO_REGION, y = PERSONS_VACCINATED_1PLUS_DOSE_PER100, label = WHO_REGION)) + # fill adiciona cores ao 2o fator: gender
  geom_bar(stat = "identity") +
  theme_classic() +
  labs(x = "WHO regional offices",
       y = "Cumulative persons vaccinated with at least one dose (per 100 population)")
grafico
grafico + theme(axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), axis.text = element_text(size = 8))

#valor máximo da coluna
print(paste("highest index is : ",max(df1$PERSONS_VACCINATED_1PLUS_DOSE_PER100)))


