library(tidyverse)

state <- read.csv("D:/Schule/Soft_statistic/S6&7/stateData.csv")

state <- read.csv("C:/Users/User/Desktop/an 2/sem2/software/s6")  #??

head(state)
tail(state)
str(state)

diamante <- read.csv('diamonds.csv', sep=" ")
str(diamante)

data(diamonds)

pf <- read.csv('pseudo_facebook.tsv', sep='\t')

library(openxlsx)
write.xlsx(diamante, 'diamante.xlsx')
diamante_din_excel <- read.xlsx('diamante.xlsx')
str(diamonds)
str(diamante)
####

date <- c('Est', 'Vest', 'Nord', 'Est', 'Est', 'Vest', 'Nord')
date
is.factor(date)
date_factor <- factor(date)


date_factor
qplot(date_factor)


date_reordonate <- factor(date_factor, levels = c('Est', 'Vest', 'Nord'))
qplot(date_reordonate)


diamante <- read.csv('diamonds.csv', sep=" ")
str(diamante)

diamante$cut <- factor(diamante$cut)


a <- c(1,2,1,1,2,1,1)
a_factor <- factor(a)
a_factor
a_factor <- factor(a, labels=c('eticheta 1', 'eticheta 2'))
a_factor


as.numeric(a_factor)
as.character(a_factor)


### generare numere aleatoare

x <- runif(10000, min=10, max=15)
qplot(x)


sample(100, 10, replace=FALSE)
sample(date, 3, replace=FALSE)

set.seed(5)
sample(10, 5, replace=TRUE)

x <- rnorm(100000, mean=10, sd=3)
qplot(x)

pf <- read.csv('pseudo_facebook.tsv', sep='\t')
head(pf)
str(pf)

pf_sintetizat <- pf %>%
  group_by(age, gender)%>%
  summarize(
    media_fc=mean(friend_count),
    mediana_fc=median(friend_count),
    nr=n()
  )
head(pf_sintetizat)

library(reshape2)


pf_sintetizat_lat <- dcast(pf_sintetizat, age~gender, value.var = 'media_fc')
pf_sintetizat_lat


### impartire pe intervale

data(diamonds)

summary(diamonds$price)

diamonds$intervale_pret <- cut(diamonds$price, breaks = c(0, 1000, 5000, 10000, 20000))
table(diamonds$intervale_pret)


ggplot(diamonds)+
 geom_bar(aes(intervale_pret))

diamonds$intervale_pret <- factor(diamonds$intervale_pret, labels= c('sub 1000', '1000-5000', '5000-10000', 'peste 10000'))
