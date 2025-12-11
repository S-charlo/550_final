here::i_am("code/1_make_table1.R")

data <- readRDS(
  file = here::here("output/clean_places_data.rds")
)

library(dplyr)
library(gtsummary)
library(broom)

table_one <- data |>
  select("county", "food_insecurity_prev", "trans_count", "SNAP_count", "house_count") |>
  tbl_summary(by = "food_insecurity_prev") |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Food Insecurity above or below the Nat. Average (13.5%)**") |>
  modify_caption("**Evaluating Food Insecurity & Potential Covariates**") |>
  add_overall() |>
  add_p()

saveRDS(
  table_one,
  file = here::here("tables/table_one.rds")
)