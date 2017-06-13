#!/usr/bin/env bash

NOW="$(date +'%d_%m_%Y_%H_%M_%S')"
FILENAME="$MYSQL_DATABASE"_"$NOW".sql.gz
FILEPATH="/tmp/"
LOGPATH="/var/log/"
LOGFILE="$LOGPATH"backup_crm"$(date +'%Y_%m')".log

echo "mysqldump started at $(date +'%d-%m-%Y %H:%M:%S')" >> $LOGFILE
mysqldump --host=$MYSQL_HOST --user=root --password=$MYSQL_ROOT_PASSWORD --default-character-set=utf8 $MYSQL_DATABASE | gzip > $FILEPATH$FILENAME
echo "mysqldump for crm finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$LOGFILE"
/root/.local/bin/aws s3 cp $FILEPATH$FILENAME $S3_URL$FILENAME
echo "copy db wp and crm to  S3" >> "$LOGFILE"
find $FILEPATH -name "*_mre_*" -exec rm {} +
echo "operation finished at $(date +'%d-%m-%Y %H:%M:%S')" >> $LOGFILE
echo "*************************" >> "$LOGFILE"
exit 0


