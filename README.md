# Cron Jobs for MySQL 

##To Do's:
* Shell script backup, add if clause to for dev vs. prod
* More environment variables for more cron functionality

## Description
Cron jobs SugarCRM DB backup to AWS S3 and let's encrypt cert update, based on environment variables 

## Source Code

Github: [nohona/cron-crm](https://github.com/nohona/cron-crm)

## Installation

* To build:
```bash
docker build -f dockerfile -t nohona/cron-crm:latest .
```
* To run:
```bash
docker run -d -t -i -e MYSQL_ROOT_PASSWORD='<password>' \
  -e MYSQL_HOST='<mysql-host-url>' \
  -e MYSQL_DATABASE='<db-name>' -e MYSQL_USER='<db-user>' \
  -e MYSQL_PASSWORD='<user-password>' -e S3_URL='<sr-url>' \
  -e AWS_ACCESS_KEY_ID='<aws-key>' \
  -e AWS_SECRET_ACCESS_KEY='<aws-secret>' \
  --name cron-crm <dockerhub-user-name>/cron-crm:latest
```

* Container shell access:
```bash
docker exec -it cron-crm bash
docker logs cron-crm
```

## Resources:
* Make above environment variables available to system cron job
* [System-wide environment variables](https://help.ubuntu.com/community/EnvironmentVariables)