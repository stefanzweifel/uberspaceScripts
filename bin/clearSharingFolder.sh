#!/bin/sh
#
# Clear Sharing folder
#
# Kudos: https://gist.github.com/bl1nk/24597861ad7e29bbc41c

PATH=PATH_TO_SHARING_FOLDER

find $PATH -type f ! -name index.html -mmin +1440 -delete