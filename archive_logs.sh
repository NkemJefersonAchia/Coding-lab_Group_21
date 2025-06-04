#!/bin/bash

echo "Select a log to archive:"
echo "1) heart_rate_log.log"
echo "2) temperature_log.log"
echo "3) water_usage_log.log"
read -p "Enter your choice [1-3]: " choice

timestamp=$(date +%Y-%m-%d_%H-%M-%S)

if [ "$choice" = "1" ]; then
source="hospital_data/active_logs/heart_rate_log.log"
desti="hospital_data/archived_logs/heart_data_archive/heart_rate_$timestamp.log"
elif [ "$choice" = "2" ]; then
source="hospital_data/active_logs/temperature_log.log"
desti="hospital_data/archived_logs/temperature_data_archive/temperature_$timestamp.log"
elif [ "$choice" = "3" ]; then
source="hospital_data/active_logs/water_usage_log.log"
desti="hospital_data/archived_logs/water_usage_data_archive/water_usage_$timestamp.log"
else
echo "Invalid choice"
exit 1
fi

if [ ! -f "$source" ]; then
echo "Log file does not exist. Creating it..."
mkdir -p "$(dirname "$source")"
touch "$source"
echo "Created $source"
fi
mkdir -p "$(dirname "$desti")"

mv "$source" "$desti"
touch "$source"

echo "Archived and reset $source"
