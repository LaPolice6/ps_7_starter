library(tidyverse)
library(dplyr)
library(readr)
library(janitor)
library(fs)
library(knitr)
library(formattable)
library(lubridate)
library(date)
library(foreign)
library(kableExtra)
library(scales)

#results Data
Results_data <- read_csv("Ps_7 Data.csv")

#Upshot Data

download.file(url = "https://goo.gl/ZRCBda",
              destfile = "2018-live-poll-results-master.zip",
              mode = "wb")
unzip("2018-live-poll-results-master.zip")

df <- fs::dir_ls("2018-live-poll-results-master/data") %>%
  map_dfr(read_csv, .id = "source") %>% 
  
  mutate(state = toupper(str_sub(source, 51, 52))) %>%
  mutate(office = toupper(str_sub(source, 53, 54))) %>%
  mutate(state_dis = str_sub(source, 51, 54)) %>%
  mutate(wave = str_sub(source, 55, 56))
