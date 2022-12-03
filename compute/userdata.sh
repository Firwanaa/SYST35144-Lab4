#!/bin/bash
yum update -y
yum install httpd -y
cd /var/www/html
echo "VM $(hostname -f)" > index.html
systemctl restart httpd
systemctl enable httpd