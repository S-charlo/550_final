here::i_am("code/3_render_report.R")

library(rmarkdown)

out_dir <- here::here("report")
if (!dir.exists(out_dir)) {
  dir.create(out_dir, recursive = TRUE)
}

rendered_report <- render(
  input       = here::here("final_report.Rmd"),
  output_file = "final_report.html",
  output_dir  = out_dir
)