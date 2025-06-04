# Beginning of David's Work

# Menu for user input
#!/bin/bash
echo " Select a log file to analyze"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
echo "Enter choice (1-3)"
read choice

#This Set log file based on input

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

if [[ ! -f active_logs/$name ]]; then
        echo " $name does not exist!!!"
        exit 1
fi

#This part recreates the Report if it doesn't exist 

if [[ ! -d reports/ ]]; then
        echo " Reports directory does not exist."
        echo "creating..."
        sleep 2
        echo "Done!"
        sleep 2
        mkdir -p reports/
        clear
fi
sleep 2
echo "Generating report..."
#A unique timestamp is addded to each report file to be able to distinguish the report files being generated

time_stamp=$(date '+%Y-%m-%d_%H:%M:%S')
sleep 2




# Beginning of Jeferson's work
#This part of th e code appends all the neccessary files to the report generated
#and then moves it to the reports dir



time_stamp=$(date '+%Y-%m-%d_%H:%M:%S')
{
	
	echo "_____ANALYSIS_____REPORT_____"
	echo "Date and time created: $time_stamp"
	echo "Log file: $name"
	echo " Device counts:" 
	awk '{print $3}' active_logs/$name | sort | uniq -c
	#
	#We tackled the bonus question to add the timestamp of the first and last entry
	#
	first=$(head -1 active_logs/$name | awk '{print $1, $2}')
	last=$(tail -1 active_logs/$name | awk '{print $1, $2}')
	echo " Timestamp of first entry: $first"
	echo " Timestamp of last entry: $last" 
} >> reports/analysis_report_$time_stamp.txt
echo "Report generated successfully in reports directory !!!"
