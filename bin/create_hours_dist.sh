#!/bin/bash

targetDirectory=$1

cat $targetDirectory/*/failed_login_data.txt | awk '{ print $3}' | sort | uniq -c | awk '{ print "data.addRow([\x27"$2"\x27, "$1"]);"}' > $targetDirectory/tmptxt2.txt

bin/wrap_contents.sh $targetDirectory/tmptxt2.txt html_components/hours_dist $targetDirectory/hours_dist.html

rm -f $targetDirectory/tmptxt2.txt
