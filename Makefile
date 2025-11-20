# rendering the final report
final_report.html: code/3_render_report.R final_report.Rmd output/table_one.rds output/scatterplot.png output/all_component_points.rds output/clean_places_data.rds
	Rscript code/3_render_report.R

# build output for code/1_make_table1.R
output/table_one.rds: code/1_make_table1.R output/clean_places_data.rds
	Rscript code/1_make_table1.R

# build output for code/2_make_scatter.R
output/scatterplot.png: code/2_make_scatterplot.R output/all_component_points.rds
	Rscript code/2_make_scatterplot.R
	
# build output for c code/0_load_comp_data.R
output/all_component_points.rds: code/0_load_comp_data.R raw_data/gardens_orchards_farms.csv raw_data/snap_retailers.csv
	Rscript code/0_load_comp_data.R

# build output for code/0_load_pre_data.R
output/clean_places_data.rds: code/0_load_pre_data.R raw_data/places.csv
	Rscript code/0_load_pre_data.R
	
# add make rule for renv
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

# PHONY target to clean the project directory
.PHONY: clean
clean:
	rm output*/*.rds figures/*.png clean_data*/*.rds *.html reports/*.rds tables/*.rds