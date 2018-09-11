cd $1

cat var/log/secure* | awk '{ print $1, " ", $2, " ", substr($3,1,2) " ", $11, " ", $13}' \
		< failed_login_data.txt
