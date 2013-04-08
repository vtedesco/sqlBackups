#!/bin/bash
# Forked from http://www.mon-code.net/article/2/script-shell-de-sauvegarde-des-bases-de-donnees-mysql

# Connection variables
USER='backupUser'
PASS='password'
HOST='localhost'

# Date Format
DATE=`date +%y-%m-%d`

LISTEBDD=$( echo 'show databases' | mysql -u$USER -p$PASS -h$HOST)

# For each DB
for SQL in $LISTEBDD

do

  if [ $SQL != "information_schema" ] && [ $SQL != "mysql" ] && [ $SQL != "Database" ]; then
  
    mkdir -p /var/backups/sql/$DATE
    mysqldump -u$USER -p$PASS -h$HOST $SQL | gzip > /var/backups/sql/$DATE/$SQL.sql.gz
  
  fi

done
