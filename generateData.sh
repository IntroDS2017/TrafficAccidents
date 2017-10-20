#!/usr/bin/env bash

# Runs data-generation python-scripts with pipenv.
echo "Attempting to generate data..."

echo "(1/5) Renaming streets, dropping uncertain road-addresses..."
python3 2_modify_road_usages_names.py

echo "(2/5) By car count, merging rows sharing (year, hour) which are in 15-minute range instead of hourly range..."
python3 3_merge_road_usages_hours.py

echo "(3/5) Formatting accident-data address-names to match road-usage-data..."
python3 4_change_accidents_katuosoite.py

echo "(4/5) Filtering accidents by addresses, which are included in usage-data..."
python3 5_select_accidents.py

echo "(5/5) Combining accident-data with road-usage-data..."
python3 6_combine_data.py

echo "Generation done!"
