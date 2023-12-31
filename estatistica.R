


df1 <- read.csv(file = "/Users/mjara/Downloads/exercicio_2.csv" , header = TRUE, sep = ";")

head(df1)

library(dbplyr)
library(dplyr)
library(plm)

df2 <- select(df1,Grupo,Vitamina_C)

head(df2)

# 1 passo : teste de normalidade, grupo com  valores abaixo de 30 amostras

library(tidyverse)
library(rstatix)

## separação por grupos 

df_A <- df2%>%
  filter(Grupo =="A") 

df_A


df_B <- df2%>%
  filter(Grupo =="B") 

df_C <- df2%>%
  filter(Grupo =="C") 



## teste normalidade

shap_A <- shapiro.test(df_A$Vitamina_C)
shap_A
capture.output(shap_A	, file = "shap_A.txt")
#getwd()

shap_B <- shapiro.test(df_B$Vitamina_C)
shap_B
capture.output(shap_B	, file = "shap_B.txt")


shap_C <- shapiro.test(df_C$Vitamina_C)
shap_C
capture.output(shap_C	, file = "shap_D.txt")

shap_D <- shapiro.test(df_D$Vitamina_C)
shap_D
capture.output(shap_D	, file = "shap_D.txt")
## normalidade ok : há outros parametros que devem ser verificados , como visualização de histograma etc.
## leituras recomendadas
## http://www.sthda.com/english/wiki/normality-test-in-r
## https://www.statology.org/test-for-normality-in-r/

# 2 passo: teste de homocedasticidade -  teste F


library(car)


homocedasticidade <- with(df2, leveneTest(Vitamina_C, Grupo))

homocedasticidade

## https://programa-r.forumeiros.com/t111-solucao-para-problemas-com-a-funcao-levenetest

# 3 passo: teste de ANOVA one way 

# Compute the analysis of variance
res.aov <- aov(Vitamina_C ~ Grupo, data = df2)
summary(res.aov)

TukeyHSD(res.aov)

## http://www.sthda.com/english/wiki/one-way-anova-test-in-r