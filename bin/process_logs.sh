#!/bin/bash

originalLocation=$(pwd)

#Makes a temp directory --- -d gives random name to the temp directory, I think - Needs to be deleted manually (like how we deleted tmptxt files)
NEW_TEMP_DIR=`mktemp -d`
echo $NEW_TEMP_DIR
cd $NEW_TEMP_DIR 
mkdir log_files
cd $originalLocation

for targetFile in $@
do
	tar -C $NEW_TEMP_DIR/log_files -zxf $targetFile
       	bin/process_client_logs.sh $NEW_TEMP_DIR/log_files
done

bin/create_username_dist.sh $NEW_TEMP_DIR

bin/create_hours_dist.sh $NEW_TEMP_DIR

bin/create_country_dist.sh $NEW_TEMP_DIR

bin/assemble_reports.sh $NEW_TEMP_DIR

mv $NEW_TEMP_DIR/failed_login_summary.html $originalLocation

rm -r $NEW_TEMP_DIR

