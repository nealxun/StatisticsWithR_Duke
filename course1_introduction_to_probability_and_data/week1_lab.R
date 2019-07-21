# introduction to probability and data, Duke University
# week 1 lab, introduction to R and RStudio

# preparation
rm(list = ls())
# obtain the current source file work directory
wd <- dirname(rstudioapi::getSourceEditorContext()$path)
setwd(wd)

# check if packages are installed
list.of.packages <- c("tidyverse", "reshape", "lubridate", "devtools")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) {install.packages(new.packages)}
library(tidyverse)
library(reshape)
library(lubridate)
library(devtools)

# package for this course specifically
if(!require(statsr)) {install_github("StatsWithR/statsr")}
library(statsr)

# data set 1: Dr. Arbuthnot's Baptism records
data(arbuthnot)
arbuthnot
dim(arbuthnot)
names(arbuthnot)

# q1 what years are included in this dataset
unique(arbuthnot$year)

# q2 what command would you use to extract just the counts of girls born
arbuthnot$girls
arbuthnot[, "girls"]
ggplot(data = arbuthnot) +
        geom_point(aes(x = year, y = boys, color = "boys")) +
        geom_point(aes(x = year, y = girls, color = "girls"))

arbuthnot <- arbuthnot %>%
        mutate(total = boys + girls)
ggplot(data = arbuthnot, aes(x = year, y = total)) +
        geom_line() +
        geom_point(color = "blue")

# q3 generate a plot of the proportion of boys born over time
rbuthnot <- arbuthnot %>%
        mutate(boys_ratio = boys / total)
ggplot(data = rbuthnot, aes(x = year, y = boys_ratio)) +
        geom_line() +
        geom_point(color = "blue")

arbuthnot <- arbuthnot %>%
        mutate(more_boys = boys > girls)
mean(arbuthnot$more_boys)
table(arbuthnot$more_boys)




# dataset 2: present birth records
data(present)
dim(present)
str(present)

#q4
dim(present)[2]
range(present$year)

#q5
df <- present %>%
        mutate(total = boys + girls) %>%
        mutate(boys_ratio = boys / total)
ggplot(df, aes(x = year, y = boys_ratio)) +
        geom_line() +
        geom_point()
# answer: the proportion of boys in the US has decreased over time

#q6
df <- df %>%
        mutate(more_boys = boys > girls)
mean(df$more_boys)
ggplot(df, aes(x = year, y = more_boys)) +
        geom_point()
# answer: every year there are more boys born than girls

#q7
df <- df %>%
        mutate(prop_boy_girl = boys / girls)
ggplot(df, aes(x = year, y = prop_boy_girl)) +
        geom_point() +
        geom_line()
# answer: There is initially a decrease in the boy-to-girl ratio, 
# and then an increase between 1960 and 1970, followed by a decrease.

#q8
df %>% arrange(desc(total)) %>% head()
# answer: most total number of births happend in US during the year of 2017.











