#!/bin/sh
# 
# Create a new subdomain and symlink to folder in html-root
#
# Param:    subdomain name
# Author:   Stefan Zweifel
#

# Config Var
DOMAIN="wnx.ch"; # main domain

SUBDOMAIN=$1;

if [ $# -ne 1]
    then
        echo "Please enter subdomain";
else

    # Add domain
    uberspace-add-domain -d $SUBDOMAIN.wnx.ch -w
    echo "------------------------------"
    echo "Subdomain created";
    echo "";

    # Check if folder in html root exists
    if [ ! -d /var/www/virtual/$USER/html/$SUBDOMAIN.$DOMAIN ]
        then
        # Create folder in HTML Root
        mkdir /var/www/virtual/$USER/html/$SUBDOMAIN.$DOMAIN
        echo "------------------------------"
        echo "Created project folder."
        echo "";
    fi

    # Check if symlink already exists
    if [ ! -d /var/www/virtual/$USER/$SUBDOMAIN.$DOMAIN ]
        then
        # Create symlink
        ln -s /var/www/virtual/$USER/html/$SUBDOMAIN.$DOMAIN /var/www/virtual/$USER/$SUBDOMAIN.$DOMAIN
        echo "------------------------------"
        echo "Created symlink."
        echo "";
    fi

    echo "------------------------------"
    echo "Go to /var/www/virtual/$USER/html/$SUBDOMAIN.$DOMAIN and put your files in there."

fi