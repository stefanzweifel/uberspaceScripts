#!/bin/sh
#
# Create Backup and send file to external server
#
# Author:   original by Sebastian Neef (gehaxelt.in)
#           modified by Stefan Zweifel (wnx.ch)
#

# Variables
DATE=`date +%d-%m-%Y-%H-%M-%S` #Current time
SLACK_DOMAIN='PLACE_DOMAIN_HERE'
SLACK_TOKEN='PLACE_TOKEN_HERE'

# Check if backup folder exists and create it
if [ ! -d /home/$USER/backup-$USER ]
    then
        mkdir /home/$USER/backup-$USER
    echo "Backup-folder created"
fi

# Check if backup file exists and exit
if [ -f /home/$USER/backup-$USER/backup-$DATE.tar.bz2 ]
    then
        echo "Backup already exists"
    exit 1
fi

# Create Backup files
mysqldump --user=$USER --compact --comments --dump-date --quick --all-databases | gzip > "/var/www/virtual/"$USER"/database.sql.gz"
cd /var/www/virtual/$USER
tar -cjf /home/$USER/backup-$USER/backup-$DATE.tar.bz2 *
rm /var/www/virtual/$USER/database.sql.gz

# Send File to external server
scp /home/$USER/backup-$USER/backup-$DATE.tar.bz2 USER@IP_TO_SERVER:/PATH_TO_FOLDER/backup-$USER

# Remove backup file from uberspace
rm -rf /home/$USER/backup-$USER/backup-$DATE.tar.bz2


# Send Messaget to Slack
if [ ! SLACK_DOMAIN = 'PLACE_DOMAIN_HERE']

    curl -X POST --data-urlencode 'payload={"channel": "#general", "username": "uberspaceBot", "text": "Backup complete.", "icon_emoji": ":ghost:"}' https://$SLACK_DOMAIN.slack.com/services/hooks/incoming-webhook?token=$SLACK_TOKEN

fi