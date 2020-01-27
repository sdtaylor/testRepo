library(tidyverse)
library(neonUtilities)
library(geoNEON)

woody_structure=tryCatch(neonUtilities::loadByProduct('DP1.10098.001', site='JORN',
                                                      startdate = '2018-01', enddate = '2018-12',
                                                      check.size = F))

heights = woody_structure$vst_apparentindividual %>%
  group_by(individualID, plotID, eventID) %>%
  summarise(avg_height = mean(height),
            n_stems = n()) %>%
  ungroup()

write_csv(heights,  paste0('./jorn.csv'))
