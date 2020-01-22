#!/usr/bin/env bash

sudo mkdir "/var/www/synf/Project"

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get install -y apache2

VHOST=$(cat <<EOF
<VirtualHost *:80>
    DocumentRoot "/var/www/synf/Project"
    <Directory "/var/www/synf/Project">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF
)

echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

sudo a2enmod rewrite

service apache2 restart
