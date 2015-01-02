#!/bin/sh
#
# Clear Sharing folder
# Remove all files older than 24 hours
#

$FOLDER_PATH=PATH_TO_SHARING_FOLDER

find $FOLDER_PATH -maxdepth 1 -mindepth 1 -type d -mmin +1440 -exec rm -rf {} \;