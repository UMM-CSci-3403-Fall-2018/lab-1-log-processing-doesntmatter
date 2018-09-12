#!/bin/bash

targetDirectory=$1

#Brings it one level above so it can be called from top of directory to find html_components
cd ..

#Gather required contents of failed_login_data
cat log_files/$targetDirectory/failed_login_data.txt | awk '{ print $4}' | sort | uniq -c | awk '{ print "data.addrow([\x27"$2"\x27, "$1"])"}' > tmptxt.tx
