# Cron Jobs for MySQL 

## Description
Cron jobs SugarCRM DB backup to AWS S3 and let's encrypt cert update, based on environment variables 

## Source Code

Github: [nohona/cron-crm](https://github.com/nohona/cron-crm)

## Installation

#### Let' Encrypt Setup

Keeping things in a safe place, I auto generate the certs in (place TBD) and copy them to AWS S3.
A cron job is then getting the from the S3 location updating it to apache.  
Download files from Github

```bash
git clone https://github.com/certbot/certbot /usr/local/certbot
```

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