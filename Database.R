library(tidyverse)
tiers <- read.csv("tiers_edit.csv")
tiers <- (tiers  %>% select(NAME,TIER))
dta <- read_csv("DTG 2.0-All Applicants.csv")
dta1 <- (dta %>% select(`Business Name`,City,Municipality)
         %>% filter(!is.na(City))
         %>% mutate(NAME = City)
         %>% select(NAME,Municipality))
#Name in the tier file are cities 
AllTiers <-left_join(dta1,tiers,by="NAME")
write.csv(AllTiers,"FinalTiers.csv")

#ontario regions/obiaa regions
regions <- read.csv("regionbase.csv")
regions1 <-(regions %>% select(Region,OBIAA.Region,Municipality))
AllRegions <- left_join(dta1,regions1,by="Municipality")
write.csv(AllRegions,"AllRegions.csv")


#Ontario BIAs 


