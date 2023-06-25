### number of exams
# https://acervolima.com/modifique-o-eixo-a-legenda-e-os-rotulos-do-grafico-usando-ggplot2-em-r/

library(tidyverse)
library(ggplot2)
install.packages("scales")
library(scales)



df1 <- read.csv(file = "/Users/mjara/Downloads/vaccination-data.csv" , header = TRUE, sep = ",")

head(df1)

df1

getwd()
setwd("/Users/mjara/Downloads")


str(df1)
str(df1$WHO_REGION)
str(df1$PERSONS_LAST_DOSE_PER100)

df2 <- subset(df1,WHO_REGION == "SEARO")

view(df2)





# WHO_REGION e PERSONS_LAST_DOSE - Cumulative number of persons vaccinated with a complete primary series

grafico <- df2 %>%
  ggplot(aes(x = COUNTRY, y = PERSONS_LAST_DOSE_PER100)) + 
  geom_bar(stat = "identity") +
  theme_classic() +
  labs(x = "Regional Office for the Eastern Mediterranean ",
       y = "Last dose (per 100 population)")
grafico
grafico + theme(axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), axis.text = element_text(size = 8))



ggsave(filename = "Figura1.png", grafico,
       width = 10, height = 7, dpi = 500, units = "in", device='png')
