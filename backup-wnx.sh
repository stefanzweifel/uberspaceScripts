#!/bin/bash
###Uberspace Backup-Script by Sebastian Neef
###www.gehaxelt.in
### Modified by @_stefanzweifel

##Variables
USER='wnxbash' #Uberspacename
DATE=`date +%d-%m-%Y-%H-%M-%S` #Current time
## END Variables

##Check if backup folder exists and create it
if [ ! -d /home/$USER/backup-wnx ]
    then
        mkdir /home/$USER/backup-wnx
    echo "Backup-folder created"
fi
##END Check

##Check if backup file exists and exit
if [ -f /home/$USER/backup-wnx/backup-$DATE.tar.bz2 ]
    then
        echo "Backup already exists"
    exit 1
fi
##END Check

##Backup
mysqldump --user=$USER --compact --comments --dump-date --quick --all-databases | gzip > "/var/www/virtual/"$USER"/database.sql.gz"
cd /var/www/virtual/$USER
tar -cjf /home/$USER/backup-wnx/backup-$DATE.tar.bz2 *
rm /var/www/virtual/$USER/database.sql.gz
##END Backup
