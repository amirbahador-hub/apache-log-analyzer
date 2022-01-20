#!/bin/bash

# 66.249.73.135 - - [20/May/2015:21:05:00 +0000] "GET /?flav=atom HTTP/1.1" 200 32352 "-" "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"

LOG_File_Name=logs

# cat $LOG_File_Name

awk -F'[ "]+' '$7 == "/" { ipcount[$1]++ }
    END { for (i in ipcount) {
        printf "%15s - %d\n", i, ipcount[i] } }' $LOG_File_Name