#!/bin/bash

header_file=$2_header.html
footer_file=$2_footer.html
text_file=$1
resulting_file=$3

# Wrap .txt file in-between two html files to form target file
cat $header_file $text_file $footer_file > $resulting_file
