#!/bin/bash
sudo su
yum update -y
yum install -y httpd
cd /var/www/html
wget https://www.free-css.com/assets/files/free-css-templates/download/page256/portfolio-perfect.zip
unzip portfolio-perfect.zip
cp -r html-freebie-portfolio-perfect-master/* /var/www/html/
rm -rf html-freebie-portfolio-perfect-master portfolio-perfect.zip 
systemctl start httpd
systemctl enable httpd