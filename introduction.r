```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

library(dplyr)
library(ggplot2)
setwd

#Quick look at dataframes

```{r pressure, echo=FALSE, fig.cap="A caption", out.width = '100%'}
knitr::include_graphics("df.png")
```

#Filter
mpg
head(mpg)
str(mpg)
names(mpg)
dim(mpg)

hist(mpg$cty)
filter(mpg, cty>25)
filter(mpg, city>25 & model=='civic')

#Select
select(mpg,manufacturer)
names(mpg)
select(mpg,c(7,8))


#Pipe
mpg%>%
  filter(cty>25)%>%
  select(c(7,8))

names(mpg)

#model with worst gas mileage
mpg%>%
  select(2,8)%>%
  filter(cty<15)

mpg%>%
   filter(cty<15)
select(2)

#Group By & Summarize
names(mpg)
select(mpg,7)

mpg%>%
  group_by(drv)%>%
  summarise(n= n(),avgcity= mean(cty, na.rm=7))

#Mutate
mpg%>%
  group_by(drv)%>%
  summarise(n= n(),avgcity= mean(cty, na.rm=7))%>%
  mutate(test= n*avgcity)

mpg%>%
  mutate(conversion = displ*.16)%>%
  arrange(desc(cty))
