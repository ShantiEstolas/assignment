#!/bin/bash

NOW=$(date +"%Y%m%d %H:%M")

directory=/home/cgestolas/Documents
log_dir=/home/cgestolas/scripts/bin

#append log file name


if [ ! -d "$directory" ]; then
 	echo "Can't find this directory!";

  	echo "Please check your input and rerun this script.";

   	exit 1;

fi

	find "$directory"/*.log -mtime -1 -exec gzip {} \; 
	ls $directory | grep *.gz | echo $NOW" Success"
	for f in $directory/*
	do
		if [ -f ${f}.gz ]; then
			echo $directory"/*.gz:"$NOW".success" >> $log_dir/zipfile.log	
			continue	
		else 
			break
		fi 
		
	done
	#find "$directory"/*.gz  >> $log_dir/zipfile.log
	#find "$directory"/*.gz -not -newermt '+0 seconds'
	
	find "$directory"/*.gz -mtime +1 -ls -delete >> $log_dir/del_file.log
	
