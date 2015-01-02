#!/bin/sh
#
# Create a new domain and symlink to folder in html root
# to create new Laravel Project
#
# Param:    domain name
# Author:   Stefan Zweifel
#

DOMAIN=$1;
REPO=$2;

if [[ ! -z "$1" ]]
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
        mkdir -p /var/www/virtual/$USER/html/$DOMAIN/public
        echo "------------------------------"
        echo "Created project folder."
        echo "";
    fi

    # Check if symlink already exists
    if [ ! -d /var/www/virtual/$USER/$DOMAIN ]
        then
        # Create symlink
        ln -s /var/www/virtual/$USER/html/$DOMAIN/public /var/www/virtual/$USER/$DOMAIN
        echo "------------------------------"
        echo "Created symlink."
        echo "";
    fi

    # Ask user if repo should be cloned
    if [[ ! -z "$2" ]]
        then

        read -p "Should we clone given URL to project folder? [y/n] " -n 1 -r
        echo    # (optional) move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            # do dangerous stuff
            rm -rf /var/www/virtual/$USER/html/$DOMAIN/public
            git clone $REPO /var/www/virtual/$USER/html/$DOMAIN/
            echo "------------------------------"
            echo "Cloned repo to project folder"
            echo "Now cd into /var/www/virtual/$USER/html/$DOMAIN/ and do composer install"
            echo "";
        fi

    else

        echo "------------------------------"
        echo "Go to /var/www/virtual/$USER/html/$DOMAIN and do your Laravel stuff there."

    fi



fi