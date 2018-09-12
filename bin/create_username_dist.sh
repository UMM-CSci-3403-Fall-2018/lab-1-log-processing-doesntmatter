#!/bin/bash

targetDirectory=$1

#Gather required contents of failed_login_data, sorts it, then counts the number of each, and then creates new format and puts it into a text file in target discovery
cat $targetDirectory/*/failed_login_data.txt | awk '{ print $4}' | sort | uniq -c | awk '{ print "data.addRow([\x27"$2"\x27, "$1"]);"}' > $targetDirectory/tmptxt.txt

#Wraps text in tmptxt.txt with header and footer html files in target directory
bin/wrap_contents.sh $targetDirectory/tmptxt.txt html_components/username_dist $targetDirectory/username_dist.html

#Delete temporary text file
rm -f $targetDirectory/tmptxt.txt
