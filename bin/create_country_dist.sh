#!/bin/bash

targetDirectory=$1

cat $targetDirectory/*/failed_login_data.txt | awk '{ print $5}' | sort | join -1 2 -2 1 etc/country_IP_map.txt | awk ' { print $2}' | uniq -c | awk '{ print "data.addRow([\x27"$2"\x27, "$1"]);"}' > $targetDirectory/tmptxt3.txt 

bin/wrap_contents.sh $targetDirectory/tmptxt3.txt html_components/country_dist $targetDirectory/country_dist.html


