#!/bin/sh
#
# Clear Sharing folder
#

$FOLDER_PATH=PATH_TO_SHARING_FOLDER

/bin/find $FOLDER_PATH -maxdepth 1 -mindepth 1 -type d -mmin +1440 -exec rm -rf {} \;