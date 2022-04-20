#!/bin/bash

BACKUP=db-$(date +%H-%M-%S).sql
DB_USER=$1
DB_PASSWD=$2
DB_NAME=$3
BACKUT_NAME=$4
profile=$5

echo "creating mysql backup to $BACKUP...." && \ 
mkdir -p /tmp/db_backup && \
mysqldump -u $DB_USER -p $DB_PASSWD $DB_NAME > /tmp/$BACKUP && \
echo "uploading mysql backup to $BACKUT_NAME....."
aws s3 cp /tmp/$BACKUP s3://$BACKUT_NAME/$BACKUP --profile $profile
echo "$BACKUP uploaded sucessfully...."
