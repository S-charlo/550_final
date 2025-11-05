library(sf)
library(dplyr)
library(ggplot2)

#Load data, select and rename columns. Data set already has point data
here::i_am("code/0_load_pre_data.R")
absolute_path_to_ag <- here::here("raw_data/places.csv")
places <- read.csv(absolute_path_to_ag, header = TRUE, stringsAsFactors = FALSE, na.strings = c("NaN", "Inf", "-Inf"))

places_data <- places |>
  select(Tract = TractFIPS, Food_insecurity = FOODINSECU_CrudePrev, SNAP = FOODSTAMP_CrudePrev, Housing_insecurity = HOUSINSECU_CrudePrev, Transportation_barriers = LACKTRPT_CrudePrev, County = CountyName, Population = TotalPopulation, Adults = TotalPop18plus, Geolocation)

head(places_data)

#Save clean data as an object
saveRDS(
  places_data, 
  file = here::here("clean_data/places_data.rds")
)