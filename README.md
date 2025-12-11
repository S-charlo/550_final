Final Project Compiled Report
================
Sofia Charlot

# Building the Final Report

### System requirements

- Docker
- Make
- Git

# Building the report using Docker

### Build the image

- From the project directory run: `docker build -t final_project .`

### Create the report

- Then run: `make docker_report`

- The compiled `final_report.html` will appear in the `report/` folder
  of the project directory. Inside the container, the `/final/report`
  folder is mounted to the local `report/` folder, so
  `final_report.html` will be written directly into the local `report/`
  directory.

- The report includes:

  - A brief introduction of the research objective
  - Tabular analysis for the variables of interest
  - Graphical analysis for the point data

## Project Directory Contents

### Code for data cleaning

- `code/0_load_pre_data.R`
  - Loads and cleans data for the outcome (food insecurity) and
    additional predictor variables (transportation barriers, SNAP usage,
    and housing insecurity) from the PLACES dataset
  - Saves the cleaned data as an `.rds` object in the `output/` folder
- `code/0_load_comp_data.R`
  - Loads and cleans data for the primary predictor variables
    (commercial and communal food retailers/components)
  - Saves data as an `.rds` object in the `output/` folder

### Code for tables

- `code/1_make_table1.R`
  - Generates a summary table with descriptive statistics evaluating
    food insecurity and potential covariates
  - Saves the table as an `.rds` object in the `tables/` folder

### Code for figures

- `code/2_make_scatterplot.R`
  - Plot the food environment point data onto a map of the Metro Atlanta
    area
  - Saves the figure as a `.png` object in the `figures/` folder

### Code to generate the compiled report

- `code/3_render_report.R`
  - Renders the `final_report.Rmd` and writes the HTML report to
    `report/final_report.html`
