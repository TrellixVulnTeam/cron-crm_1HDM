#!/usr/bin/env bash

NOW="$(date +'%d_%m_%Y_%H_%M_%S')"
FILENAME_CRM="crm_mre_$NOW".sql.gz
FILEPATH="/tmp/"
LOGPATH="/var/log/"
LOGFILE="$LOGPATH"backup_crm"$(date +'%Y_%m')".log

echo "mysqldump started at $(date +'%d-%m-%Y %H:%M:%S')" >> $LOGFILE
mysqldump --host=db_crm --user=root --password=$MYSQL_ROOT_PASSWORD --default-character-set=utf8 $MYSQL_DATABASE | gzip > $FILEPATH$FILENAME_CRM
echo "mysqldump for crm finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$LOGFILE"
/root/.local/bin/aws s3 cp $FILEPATH$FILENAME_CRM $S3_URL$FILENAME_CRM
echo "copy db wp and crm to  S3" >> "$LOGFILE"
find $FILEPATH -name "*_mre_*" -exec rm {} +
echo "operation finished at $(date +'%d-%m-%Y %H:%M:%S')" >> $LOGFILE
echo "*************************" >> "$LOGFILE"
exit 0


