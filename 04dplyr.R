rm(list = ls())
library (tidyverse)
library (here)
path <- here ("data", "SAFI_clean.csv")
interviews <- read_csv (path, na = "NULL")
names (interviews)
select(interviews, village, interview_date, no_membrs)
interviews[,c("village","interview_date","no_members")]
select(interviews,village:respondent_wall_type)
select(interviews, -c(1:3))
filter(interviews, village == "Chirodzo" &
         rooms > 1 &
         no_meals > 2)
filter(interviews, village == "Chirodzo",
       rooms > 1,
       no_meals > 2)

#pipe

interviews |>
  filter(village == "chiridzo") |>
  select(village:respondent_wall_type) |>
  arrange(desc(no_membrs)) |>
  filter(respondent_wall_type == "burntbricks")

interviews |>
  filter(memb_assoc == "yes") |>
  select(affect_conflicts, liv_count, no_meals)


interviews %>%
  group_by(village,memb_assoc) |>
  summarise(mean_no_membrs = mean(no_membrs))

interviews |>
  filter(!is.na(memb_assoc)) |>
  group_by(village,memb_assoc) |>
  summarise(mean_no_membrs = mean(no_membrs), 
            min_no_membrs = min(no_membrs)) |>
  arrange(desc(count))            

interviews_total_meals <- interviews %>%
  mutate(total_meals = no_membrs * no_meals) %>%
  filter(total_meals > 20) %>%
  select(village, total_meals)

interviews %>%
  group_by(village) %>%
  summarize(mean_no_membrs = mean(no_membrs))

interviews %>%
  filter(!is.na(memb_assoc)) %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs),
            min_membrs = min(no_membrs))
interviews %>%
  group_by(village) %>%
  summarize(mean_no_membrs = mean(no_membrs))

interviews %>%
  mutate(month = month(interview_date),
         day = day(interview_date),
         year = year(interview_date)) %>%
  group_by(year, month) %>%
  summarize(max_no_membrs = max(no_membrs))
