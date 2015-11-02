#!/usr/bin/env bash
cd /var/www
wget https://github.com/cakephp/cakephp/zipball/2.7.2
yum -y install unzip
unzip 2.7.2
rm -rf 2.7.2
mv cakephp-cakephp-9dd13f9 catalog
chmod 777 -R /var/www/catalog/app/tmp/

mysql -u root -ppassword -e "CREATE DATABASE catalog"

sed -i 's/DYhG93b0qyJfIxfs2guVoUubWwvniR2G0FgaC9mi/4Zoz2P12BXDRocwwEEwRcs7fh3BpuTvfZKDyXjIR/g' /var/www/catalog/app/Config/core.php
sed -i 's/76859309657453542496749683645/622400368205150257591831657587/g' /var/www/catalog/app/Config/core.php
sed -i 's/\/\/date_default_timezone_set/date_default_timezone_set/g' /var/www/catalog/app/Config/core.php

cp /var/www/catalog/app/Config/database.php.default /var/www/catalog/app/Config/database.php
sed -i '/^class DATABASE_CONFIG {$/,/user/s/user/root/' /var/www/catalog/app/Config/database.php
sed -i '/^class DATABASE_CONFIG {$/,/password/s/password/password/' /var/www/catalog/app/Config/database.php
sed -i '/^class DATABASE_CONFIG {$/,/database_name/s/database_name/catalog/' /var/www/catalog/app/Config/database.php

sed -i 's/^DocumentRoot \"\/var\/www\/html\"$/DocumentRoot \"\/var\/www\/catalog\"/' /etc/httpd/conf/httpd.conf
sed -i '/^<Directory \/>$/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
sed -i 's/^<Directory \"\/var\/www\/html\">$/<Directory \"\/var\/www\/catalog\">/' /etc/httpd/conf/httpd.conf
sed -i '/^<Directory \"\/var\/www\/catalog\">$/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf