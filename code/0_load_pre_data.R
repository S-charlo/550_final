library(sf)
library(dplyr)
library(ggplot2)
library(labelled)
library(stringr)

#Load data, select and rename columns. Data set already has point data
here::i_am("code/0_load_pre_data.R")
absolute_path_to_ag <- here::here("raw_data/places.csv")
places <- read.csv(absolute_path_to_ag, header = TRUE, stringsAsFactors = FALSE, na.strings = c("NaN", "Inf", "-Inf"))

places_data <- places |>
  select(tract = TractFIPS, food_insecurity = FOODINSECU_CrudePrev, SNAP = FOODSTAMP_CrudePrev, housing_insecure = HOUSINSECU_CrudePrev, trans_barriers = LACKTRPT_CrudePrev, county = CountyName, population = TotalPopulation, adults = TotalPop18plus, geolocation = Geolocation)

head(places_data)

#Remove commas and convert to numeric to generate counts
places_data <- places_data |>
  mutate(
    adults = str_replace_all(adults, ",", ""),   
    adults = as.numeric(adults)                 
  )

#Mutate columns and data to get counts from prevalence and format data for table one
places_data <- places_data |>
  mutate(food_count = food_insecurity * adults,
         trans_count = trans_barriers * adults,
         SNAP_count = SNAP * adults,
         house_count = housing_insecure * adults)

var_label(places_data) <- list(
  trans_count  = "Transportation Barriers",
  trans_barriers = "Transportation Barrier Prevalence", 
  SNAP_count = "SNAP (Food Stamps) Usage",
  house_count = "Housing Insecure",
  county = "County",
  food_insecurity = "Food Insecurity Prevalence"
)

places_data$food_insecurity_prev <- ifelse(places_data$food_insecurity < 13.5, "< 13.5%", ">= 13.5%")

#Save clean data as an object
saveRDS(
  places_data, 
  file = here::here("output/clean_places_data.rds")
)


