here::i_am("code/3_render_report.R")

library(rmarkdown)
rendered_report <- render("final_report.Rmd")

saveRDS(
  rendered_report,
  file = here::here("reports/final_report.rds")
)
