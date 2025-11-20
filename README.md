Final Project Organization
================
Sofia Charlot

# Final Report

Generate the final report using the Makefile in the project directory.
Type “make” in the terminal to generate the `final_report.html` in the
project directory.

The report includes a brief introduction to my research objective,
tabular analysis for the variables of interest, and graphical analysis
for the point data.

`code/3_render_report.R` - renders the `final_report.Rmd`

# Project Environment
To restore the package environment run `make install` in the terminal to 
restore the package library. This rule installs the renv package and sets up 
project library with all relevant packages in a `renv.lock` file. 

# Code for data cleaning

`code/0_load_pre_data.R` - loads and cleans data for the outcome (food
insecurity) and additional predictor (transportation barriers, SNAP
usage, and housing insecurity) variables in the PLACES dataset

- Saves data as a `.rds` object in the `output/` folder

`code/0_load_comp_data.R` - Loads and cleans data for the primary
predictor variables (commercial and communal food retailers/components)

- Saves data as a `.rds` object in the `output/` folder

# Code for tables

`code/1_make_table1.R` - Generated a summary table with descriptive
statistics evaluating food insecurity & potential covariates

- Saves data as a `.rds` object in the `tables/` folder

# Code for figures

`code/2_make_scatterplot.R` - Plot the food environment point data onto
a map of the Metro Atlanta area

- Saves data as a `.png` object in the `figures/` folder
