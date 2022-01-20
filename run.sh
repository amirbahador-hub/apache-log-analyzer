#!/bin/bash

# 66.249.73.135 - - [20/May/2015:21:05:00 +0000] "GET /?flav=atom HTTP/1.1" 200 32352 "-" "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
# ip address    - -  time stamp                  "Request"                             -"UserAgent"  
LOG_File_Name=logs
Link_Lookup=http://www.semicomplete.com/style2.css

# awk -F\" '{print $4}' $LOG_File_Name    # referer  
# awk -F\" '{print $6}' $LOG_File_Name    # user agent
# awk '{print $1}' $LOG_File_Name           # ip address 
# awk -F\" '{print $2}' $LOG_File_Name    # request line (%r)

# MOST user agent
echo "---------------------------------------- MOST user agent -------------------------------------------------"
awk -F\" '{print $6}' $LOG_File_Name | sort | uniq -c | sort -nr | head -n 10

# Most ip count
echo "---------------------------------------- MOST ip count -------------------------------------------------"
awk '{print $1}' $LOG_File_Name | sort | uniq -c | sort -nr | head -n 10

# Most  referer
echo "---------------------------------------- MOST user referer -------------------------------------------------"
awk -F\" '{print $4}' $LOG_File_Name | sort | uniq -c | sort -nr | head -n 11 | tail -n 10

# Count a url repitition
echo "---------------------------------------- MOST url viewed -------------------------------------------------"
echo $Link_Lookup
grep -o $Link_Lookup $LOG_File_Name | wc -l

# Most Viewed Browsers
echo "---------------------------------------- MOST viewed browser -------------------------------------------------"
awk '{logs[$(NF)]++} END {for (browser in logs) print browser, logs[browser]}' $LOG_File_Name 

# Most Viewed os
echo "---------------------------------------- MOST viewed os -------------------------------------------------"
awk '{logs[$13]++} END {for (os in logs) print os, logs[os]}' $LOG_File_Name 