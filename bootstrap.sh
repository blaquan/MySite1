#!/usr/bin/env bash

#sudo apt-get update
#sudo tasksel install lamp-server
#sudo apt-get update
#sudo apt-get install apache2 php5 libapache2-mod-php5 mysql-server libapache2-mod-auth-mysql php5-mysql

#!/bin/bash

# Updating repository

sudo apt-get -y update

# Installing Apache

sudo apt-get -y install apache2

# Installing MySQL and it's dependencies, Also, setting up root password for MySQL as it will prompt to enter the password during installation

sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql

# Installing PHP and it's dependencies
sudo apt-get -y install php5 libapache2-mod-php5 php5-mcrypt

sudo cp /srv/website/000-default /etc/apache2/sites-enabled

sudo service apache2 restart