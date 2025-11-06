here::i_am("code/2_make_scatterplot.R")

all_component_points <- readRDS(
  file = here::here("output/all_component_points.rds")
)

library(ggplot2)
library(sf)
library(tigris)
library(dplyr)
options(tigris_use_cache = TRUE)

#Georgia
counties <- counties(state = "GA", cb = TRUE) |>
  dplyr::filter(NAMELSAD %in% c("Cherokee County", "Clayton County", "Cobb County", "DeKalb County", "Douglas County", "Fayette County", "Forsyth County", "Fulton County", "Gwinnett County", "Henry County", "Rockdale County"))

st_crs(counties)


#Plot and save all component types
all_component_points <- st_transform(all_component_points, 4326)  # EPSG:4326 = lon/lat

plotted_component_points <- 
  ggplot() +
  geom_sf(data = counties, fill = NA, color = "black", linewidth = 0.8) +
  geom_sf(data = all_component_points, aes(color = Type)) +
  coord_sf(xlim = st_bbox(all_component_points)[c("xmin", "xmax")],
           ylim = st_bbox(all_component_points)[c("ymin", "ymax")],
           expand = TRUE) +
  labs(
    title = "The Commercial and Communal Food Evironment in the Metro Atlanta Area"
  )
  theme_minimal()

ggsave(
  here::here("figures/plotted_component_points.png"),
  plot = plotted_component_points,
  device = "png"
)