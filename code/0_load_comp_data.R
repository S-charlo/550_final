library(sf)
library(dplyr)
library(ggplot2)

here::i_am("code/0_load_comp_data.R")
absolute_path_to_ag <- here::here("raw_data/gardens_orchards_farms.csv")
agri_data <- read.csv(absolute_path_to_ag, header = TRUE, stringsAsFactors = FALSE, na.strings = c("NaN", "Inf", "-Inf"))

# Load ag data, select only relevant columns, correct x and y to lon and lat and make them numeric
ag_data <- agri_data |>
  select(Type, Latitude = y, Longitude = x, County, Name, Address, City, ZIP)

ag_data$Longitude <- as.numeric(ag_data$Longitude)
ag_data$Latitude <- as.numeric(ag_data$Latitude)

head(ag_data)

# Load farmers markets and commercial data and select only relevant columns
here::i_am("code/0_load_comp_data.R")
absolute_path_to_fm_cm <- here::here("raw_data/snap_retailers.csv")
snap_data <- read.csv(absolute_path_to_fm_cm, header = TRUE, stringsAsFactors = FALSE, na.strings = c("NaN", "Inf", "-Inf"))

fm_cm_data <- snap_data |>
  select(Type, Latitude, Longitude, County, Name, Address, City, ZIP)

fm_cm_data$Longitude <- as.numeric(fm_cm_data$Longitude)
fm_cm_data$Latitude <- as.numeric(fm_cm_data$Latitude)

head(fm_cm_data)

#combine data sets using a row bind 
all_component_data <- bind_rows(ag_data, fm_cm_data)

head(all_component_data)

#Save combined data as an object
saveRDS(
  all_component_data, 
  file = here::here("output/all_component_data.rds")
)

#Turning this into a sf point layer 
all_component_points <- st_as_sf(all_component_data,
                        coords = c("Longitude","Latitude"),
                        crs = 4326)

#Save sf point layer as an object
saveRDS(
  all_component_points, 
  file = here::here("output/all_component_points.rds")
)

