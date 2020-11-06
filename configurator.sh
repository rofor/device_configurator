#!/bin/bash

# generates multiple config files using matrix data

# to do
	# osx compatability
	# configuration_file.txt
	# example_file.csv


# get job number from matrix file name
jobnumber=$(echo "$1" | awk -F'_' '{print $2}')

# remove old config file directory
rm -R job_"$jobnumber"_config

# create new config file directory
mkdir  job_"$jobnumber"_config

# skip first line, then read matrix file row by row
sed 1d $1 | while IFS='' read -r line
 do

# execute the following for each row in file

	# assign value of each cell in row to a variable
	device=$(echo $line | awk -F',' '{print $1}')
	area=$(echo $line | awk -F',' '{print $2}')
	model=$(echo $line | awk -F',' '{print $3}')
	file=$(echo $line | awk -F',' '{print $4}')
	ip=$(echo $line | awk -F',' '{print $5}')
	number=$(echo $line | awk -F',' '{print $6}')
	extension=$(echo $line | awk -F',' '{print $7}')
	name=$(echo $line | awk -F',' '{print $8}')
	port1=$(echo $line | awk -F',' '{print $9}')
	port2=$(echo $line | awk -F',' '{print $10}')
	port3=$(echo $line | awk -F',' '{print $11}')
	port4=$(echo $line | awk -F',' '{print $12}')
	port5=$(echo $line | awk -F',' '{print $13}')
	port6=$(echo $line | awk -F',' '{print $13}')
	port7=$(echo $line | awk -F',' '{print $14}')
	port8=$(echo $line | awk -F',' '{print $15}')
	filetype=$(echo $line | awk -F',' '{print $16}')

	# select a device configuration template to corrospond to the model variable
	# populate the file with all the required variables
	# then save as the specified filetype to the config directory
	eval "cat <<EOF > job_"$jobnumber"_config/area$area.$device.$filetype
		$(<~/documents/networking/admin/templates/$model.txt)
EOF
	" 2> /dev/null


done

