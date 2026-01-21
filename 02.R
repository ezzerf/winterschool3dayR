3+1
area_acres = 60
hh_members <- c(3,8,12,5)
hh_members
class(hh_members)
wall_type <- c("muddaub", "burntbricks", "sunbricks")
wall_type
length(hh_members)
str(hh_members)
possessions <- c("bicycle", "radio", "television")
possessions <- c(possessions, "mobile_phone")
possessions <- c("car", possessions)
possessions

x = c(3,3:7, -1, 5)

num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")
class(num_char)
class(num_logical)
class(char_logical)
class(tricky)

wall_type
wall_type[3]
wall_type[2:3]
wall_type[c(2,3,1,1,1,2,2,3,1)]

hh_members
hh_members[-c(1,3)]
a <- hh_members[-c(1,3)]

a

hh_members[c(T,F,T,T)]
hh_members > 5
hh_members[hh_members >=5]
hh_members[hh_members < 4 | hh_members > 7]
hh_members[hh_members >= 4 & hh_members <= 7]
possessions <- c("car", "bicycle", "radio", "television", "mobile_phone")
possessions[possessions == "car" | possessions == "bicycle"] # returns both car and bicycle
possessions %in% c("car", "bicycle")

#misdata

rooms <- c(2, 1, 1, NA, 7)
mean(rooms)
max(rooms)
mean(rooms, na.rm = TRUE)
max(rooms, na.rm = TRUE)
anyNA(rooms)
is.na(rooms)
rooms[!is.na(rooms)]
sum(is.na(rooms))
complete.cases(rooms)

rooms <- c(1, 2, 1, 1, NA, 3, 1, 3, 2, 1, 1, 8, 3, 1, NA, 1)
median(rooms,na.rm = TRUE)
sum(rooms >= 2, na.rm = T)
