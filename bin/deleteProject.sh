#!/bin/sh
#
# Delete domain and project folder in HTML root
#
# Param:    subdomain name
# Author:   Stefan Zweifel
#

DOMAIN=$1;

if [ $# -ne 1 ]
    then
        echo "Please enter domain.";
else

    # Add domain
    uberspace-del-domain -d $DOMAIN -w
    echo "------------------------------"
    echo "Domain $DOMAIN deleted.";
    echo "";

    # Check if folder in html root exists
    if [ -d /var/www/virtual/$USER/html/$DOMAIN ]
        then
        # Delete folder in HTML Root
        rm -rf /var/www/virtual/$USER/html/$DOMAIN
        echo "------------------------------"
        echo "Project folder removed."
        echo "";
    fi

    # Check if symlink exists
    if [ ! -d /var/www/virtual/$USER/$DOMAIN ]
        then
        # Create symlink
        rm -rf /var/www/virtual/$USER/$DOMAIN
        echo "------------------------------"
        echo "Removed symlink."
        echo "";
    fi

    echo "------------------------------"
    echo "Task completed."

fi