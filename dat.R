ls()
rm(list=ls())
ls()
library(tidyverse)
library(here)
path <- here("data","SAFI_clean.csv")
interviews <- read_csv(path, na = "NULL")
view(interviews)
class(interviews)
dim(interviews)
nrow(interviews)
ncol(interviews)

head(interviews, n = 10)
tail(interviews)
names(interviews)


#summary

str(interviews)
summary(interviews)
glimpse(interviews)

interviews[2,1] # 1 -row 2- col
interviews[4,3]
interviews[c(1,4,6)]
interviews[[2]]
interviews[5,]
interviews["village"]
interviews[1:4,"village"]
interviews[["village"]]
interviews$no_membrs


# chlg

interviews_100 <- interviews[100, ]
## 2.
# Saving `n_rows` to improve readability and reduce duplication
n_rows <- nrow(interviews)
interviews_last <- interviews[n_rows, ]
## 3.
interviews_middle <- interviews[median(1:n_rows), ]
## 4.
interviews_head <- interviews[-(7:n_rows), ]


#factors

respondent_floor_type <- factor(c("earth", "cement", "cement", "earth"))
as.numeric(floor_type)

respondent_floor_type <- factor(floor_type)

levels(respondent_floor_type)

nlevels(respondent_floor_type)

respondent_floor_type <- fct_recode(respondent_floor_type, brick = "cement")
respondent_floor_type

respondent_floor_type_ordered <- factor(respondent_floor_type,
                                        ordered = TRUE)
respondent_floor_type_ordered

## create a vector from the data frame column "memb_assoc"
memb_assoc <- interviews$memb_assoc

## convert it into a factor
memb_assoc <- as.factor(memb_assoc)

## let's see what it looks like
memb_assoc

plot(memb_assoc)


####

memb_assoc <- interviews$memb_assoc
memb_assoc[is.na(memb_assoc)] <- "undefined"
memb_assoc <- as.factor(memb_assoc)

memb_assoc
plot(memb_assoc)


## Dates

library(lubridate)

dates <- interviews$interview_date
class(dates)
interviews$day <- day(dates)
interviews$month <- day(dates)
interviews$year <- day(dates)
interviews

char_dates = c("7/31/2028","8/8/2026","4/30/2026")
char_dates
as_date(char_dates, format = "%m/%d/%Y")
ymd(char_dates)
dmy(char_dates)
mdy(char_dates)
interviews$interview_date