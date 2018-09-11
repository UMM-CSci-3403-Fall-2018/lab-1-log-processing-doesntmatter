directory=$1

# Go to specified directory
cd $directory

# Cat-ing into secure files for specified directory, then finding and printing lines made with certain columns and putting it into failed_login_data.txt
cat var/log/secure* | awk '{ if ($6 == "Failed" && $9 == "invalid") \
 print $1, $2, substr($3,1,2), $11, $13; \
  else if ($6 == "Failed") print $1, $2, substr($3,1,2), $9, $11;}' \
		> failed_login_data.txt
