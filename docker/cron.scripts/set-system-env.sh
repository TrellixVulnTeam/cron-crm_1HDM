#!/bin/bash

# Set system wide environment variables for cron to have access to them
echo "MYSQL_DATABASE=$MYSQL_DATABASE" >> /etc/environment
echo "MYSQL_PASSWORD=$MYSQL_PASSWORD" >> /etc/environment
echo "MYSQL_USER=$MYSQL_USER" >> /etc/environment
echo "MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD" >> /etc/environment
echo "S3_URL=$S3_URL" >> /etc/environment
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> /etc/environment
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> /etc/environment
echo "AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION" >> /etc/environment

# Start cron in foreground and log
cron -f
tail -f /var/log/my.log

# Make above environment variables available system cron job
# https://help.ubuntu.com/community/EnvironmentVariables System-wide environment variables