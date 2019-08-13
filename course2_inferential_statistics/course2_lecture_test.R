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
# find critical value based on percentie
qnorm(0.99)
