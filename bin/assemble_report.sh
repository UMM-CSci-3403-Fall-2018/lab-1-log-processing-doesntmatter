#!/bin/bash

targetDirectory=$1

cat $targetDirectory/country_dist.html $targetDirectory/hours_dist.html $targetDirectory/username_dist.html > $targetDirectory/tmptxt4.txt

bin/wrap_contents.sh $targetDirectory/tmptxt4.txt html_components/summary_plots $targetDirectory/failed_login_summary.html

rm -f $targetDirectory/tmptxt4.txt
