#!/bin/sh
#
# Create a new domain and symlink to folder in html-root
#
# Param:    domain name
# Author:   Stefan Zweifel
#

DOMAIN=$1;

if [ $# -ne 1]
    then
        echo "Please enter domain";
else

    # Add domain
    uberspace-add-domain -d $DOMAIN -w
    echo "------------------------------"
    echo "Domain created";
    echo "";

    # Check if folder in html root exists
    if [ ! -d /var/www/virtual/$USER/html/$DOMAIN ]
        then
        # Create folder in HTML Root
        mkdir /var/www/virtual/$USER/html/$DOMAIN
        echo "------------------------------"
        echo "Created project folder."
        echo "";
    fi

    # Check if symlink already exists
    if [ ! -d /var/www/virtual/$USER/$DOMAIN ]
        then
        # Create symlink
        ln -s /var/www/virtual/$USER/html/$DOMAIN /var/www/virtual/$USER/$DOMAIN
        echo "------------------------------"
        echo "Created symlink."
        echo "";
    fi

    echo "------------------------------"
    echo "Go to /var/www/virtual/$USER/html/$DOMAIN and put your files there."

fi