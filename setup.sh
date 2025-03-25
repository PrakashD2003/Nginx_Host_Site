#!/bin/bash

# Update system packages
sudo yum update -y

# Install Nginx
sudo yum install -y nginx

# Move configuration files to nginx default directories from our project directory
sudo cp nginx.conf /etc/nginx/nginx.conf
sudo cp nginx-site.conf /etc/nginx/conf.d/default.conf

# Restart Nginx
sudo systemctl restart nginx
sudo systemctl enable nginx

echo "Setup complete! Your website is live."

