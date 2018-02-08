#!/bin/sh
filepath="/var/log/"
logfile="$filepath"letsencrypt_log_"$(date +'%Y_%m')".log
echo "Started renew at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
/usr/local/certbot-master/certbot-auto renew >> "$logfile"
echo "operation finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
echo "*************************" >> "$logfile"
exit 0