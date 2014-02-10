#!/bin/sh
# 
# Delete subdomain and project folder in HTML root
#
# Param:    subdomain name
# Author:   Stefan Zweifel
#

# Config Var
DOMAIN="wnx.ch"; # main domain

SUBDOMAIN=$1;

if [ $# -ne 1 ]
    then
        echo "Please enter subdomain.";
else

    # Add domain
    uberspace-del-domain -d $SUBDOMAIN.wnx.ch -w
    echo "------------------------------"
    echo "Domain $SUBDOMAIN.$DOMAIN deleted.";
    echo "";

    # Check if folder in html root exists
    if [ -d /var/www/virtual/$USER/html/$SUBDOMAIN.$DOMAIN ]
        then
        # Delete folder in HTML Root
        rm -rf /var/www/virtual/$USER/html/$SUBDOMAIN.$DOMAIN
        echo "------------------------------"
        echo "Project folder removed."
        echo "";
    fi

    # Check if symlink exists
    if [ ! -d /var/www/virtual/$USER/$SUBDOMAIN.$DOMAIN ]
        then
        # Create symlink
        rm -rf /var/www/virtual/$USER/$SUBDOMAIN.$DOMAIN
        echo "------------------------------"
        echo "Removed symlink."
        echo "";
    fi

    echo "------------------------------"
    echo "Task completed."

fi