#!/bin/bash

# 66.249.73.135 - - [20/May/2015:21:05:00 +0000] "GET /?flav=atom HTTP/1.1" 200 32352 "-" "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
# ip address    - -  time stamp                  "Request"                             -"UserAgent"  
LOG_File_Name=logs

awk -F\" '{print $4}' $LOG_File_Name    # referer  