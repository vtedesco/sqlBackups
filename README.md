sqlBackups
==========

##Description
Backup Shell Script for local MySQL server

##Installation


### Setup ssh
This will allow you to transfert backups files via SCP to another remote server

Both Client and server side
`ssh-keygen -t dsa`

Client Side
`scp .ssh/id_dsa.pub backup-user@server:~/.ssh/authorized_keys`


### Setup script

Copy the file in 
`/root/backup_sql.sh`

Set execution rights
`chmod +x /root/backup_sql.sh`

Add a cron job for this backup
`crontab -e`

Check your backups in 
`/var/backups/sql/*`

Share it, fork it and improve it.
