#!/bin/bash

# 66.249.73.135 - - [20/May/2015:21:05:00 +0000] "GET /?flav=atom HTTP/1.1" 200 32352 "-" "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
# ip address    - -  time stamp                  "Request"                             -"UserAgent"  
LOG_File_Name=logs

# awk -F\" '{print $4}' $LOG_File_Name    # referer  
# awk -F\" '{print $6}' $LOG_File_Name    # user agent
# awk '{print $1}' $LOG_File_Name           # ip address 
awk -F\" '{print $2}' $LOG_File_Name    # request line (%r)