# Inferential statistics, Duke University
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


# week1 -------------------------------------------------------------------
# z distribution, critical value
qnorm(0.975)

# z disbritution, p value, two tail
2 * pnorm(1.96, lower.tail = FALSE)

# t distribution, critical value
qt(0.025, df = 21)

# t distribution, p value, two tail
2 * pt(2.24, df = 21, lower.tail = FALSE)




# week3 -------------------------------------------------------------------
# practice quiz
# q5
pt(0.5, df = 18-1, lower.tail = FALSE)

# quiz
# q8
2 * pt(2.485, df = 26-1, lower.tail = FALSE)

# q11
75/40.13




# week4 -------------------------------------------------------------------
#practice quiz





