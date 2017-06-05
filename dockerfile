FROM ubuntu:14.04

MAINTAINER nohona <nohona@hotmail.com>

# Install pip and aws cli
RUN apt-get update && apt-get install -y python-pip \
        python-dev \
        build-essential \
        cron \
        mysql-client \
        && pip install --upgrade pip \
        && pip install --upgrade --user awscli \
        && mkdir /mysql_scripts

COPY    ./usr/local/letsencrypt /usr/local/letsencrypt
COPY    ./docker/cron.scripts/dbbackup.sh /mysql_scripts
COPY    ./docker/cron.scripts/set-system-env.sh /mysql_scripts
COPY    ./docker/cron.scripts/dbbackup-daily-cron /etc/cron.d

# Make shell scripts executable, create cron.log file
RUN chmod +rx /mysql_scripts/*.sh \
    && touch /var/log/cron.log

WORKDIR /mysql_scripts

ENTRYPOINT ["./set-system-env.sh"]

# To build:
# docker build -f dockerfile -t <user-name>/cron_crm:latest .

# To run:
# docker run -d -t -i -e MYSQL_ROOT_PASSWORD='<password>' \
#   -e MYSQL_DATABASE='<db-name>' -e MYSQL_USER='<db-user>' \
#   -e MYSQL_PASSWORD='<user-password>' -e S3_URL='<sr-url>' \
#   -e AWS_ACCESS_KEY_ID='<aws-key>' \
#   -e AWS_SECRET_ACCESS_KEY='<aws-secret>' \
#   --name cron_crm <dockerhub-user-name>/cron_crm:latest

# Container shell access:
# docker exec -it cron_crm bash
# docker logs cron_crm

# Resources:
# Docker hub Mysql: https://hub.docker.com/_/mysql/
# PIP installation: