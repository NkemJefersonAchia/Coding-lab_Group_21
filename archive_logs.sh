#!/usr/bin/bash
echo "Choose a file"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
echo "Enter a selection : 1,2 or 3"
read selection
if [[ "$selection" == "1" ]]; then
        name="heart_rate_log.log"
        folder="heart_data_archive"
elif [[ "$selection" == "2" ]]; then
        name="temperature_log.log"
        folder="temperature_data_archive"
elif [[ "$selection" == "3" ]]; then
        name="water_usage_log.log"
        folder="water_usage_data_archive"
else
        echo "Invalid! The selection $selection does not exist. Run the script again!!!"
       exit 1
fi

if [[ ! -d "$folder" ]]; then
        echo " $folder does not exit!"
        sleep 3
        echo "Creating . . ."
        mkdir -p ~/Documents/hospital_data/archived_logs/$folder
        sleep 3
        echo "$folder created successfully!!!"
fi
sleep 2
clear
time_stamp=$(date "+%Y-%m-%d_%H-%M-%S")
new_name="${name%.*}_$time_stamp.log"
path="$HOME/Documents/hospital_data/active_logs/$name"


if [[ ! -f "$path" ]]; then
        echo "The file does not exist"  
fi
mv "$path" "$HOME/Documents/hospital_data/archived_logs/$folder/$new_name"
touch "$path"
sleep 2
echo "Archiving $name ..."
sleep 2
echo "Successfully archived to $folder/$new_name"
