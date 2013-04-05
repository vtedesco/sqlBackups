#!/bin/bash
# Forked from http://www.mon-code.net/article/2/script-shell-de-sauvegarde-des-bases-de-donnees-mysql

# Date Format
DATE=`date +%y-%m-%d`

LISTEBDD=$( echo 'show databases' | mysql -uroot -p****** )

# For each DB
for SQL in $LISTEBDD

do

  if [ $SQL != "information_schema" ] && [ $SQL != "mysql" ] && [ $SQL != "Database" ]; then
  
    mkdir -p /var/backups/sql/$DATE
    mysqldump -uroot -p****** $SQL | gzip > /var/backups/sql/$DATE/$SQL.sql.gz
  
  fi

done
