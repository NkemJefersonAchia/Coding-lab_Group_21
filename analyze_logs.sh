# Beginning of David's Work

#!/usr/bin/bash
echo " Select a log file to analyze"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
echo "Enter choice (1-3)"
read choice
if [[ "$choice" == "1" ]]; then
        name="heart_rate_log.log"
elif [[ "$choice" == "2" ]]; then
        name="temperature_log.log"
elif [[ "$choice" == "3" ]]; then
        name="water_usage_log.log"
else
        echo "Invalid selection. Run the script again"
        exit 1
fi

if [[ ! -f hospital_data/active_logs/$name ]]; then
        echo " $name does not exist!!!"
        exit 1
fi

#This part recreates the Report if it doesn't exist 

if [[ ! -d hospital_data/active_logs/reports/ ]]; then
        echo " Reports directory does not exist."
        echo "creating..."
        sleep 2
        echo "Done!"
        sleep 2
        mkdir -p hospital_data/active_logs/reports/
        clear
fi
sleep 2
echo "Generating report..."
touch hospital_data/active_logs/reports/analysis_report.txt
sleep 2




# Beginning of Jeferson's work
#This part of th e code appends all the neccessary files to the report generated
#and then moves it to the reports dir



time_stamp=$(date '+%Y-%m-%d %H:%M:%S')
echo "_____ANALYSIS_____REPORT_____" >> analysis_report.txt
echo "Date and time created: $time_stamp" >> analysis_report.txt
echo "Log file: $name" >> analysis_report.txt
echo " Device counts:" >> analysis_report.txt
awk '{print $2}' hospital_data/active_logs/$name | sort | uniq -c | wc -l >> analysis_report.txt
first=$(head -1 hospital_data/active_logs/$name | cut -d ' ' -f1)
last=$(tail -1 hospital_data/active_logs/$name | cut -d ' ' -f1)
echo " Timestamp of first entry: $first" >> analysis_report.txt
echo " Timestamp of last entry: $last" >> analysis_report.txt
echo "Report generated successfully in reports/analysis_report!!!"

mv analysis_report.txt hospital_data/reports/analysis_report.txt
