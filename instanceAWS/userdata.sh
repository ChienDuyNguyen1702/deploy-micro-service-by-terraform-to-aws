#! /bin/bash
timedatectl set-timezone Asia/Saigon

apt update -y
# Install nodejs version 18.x
curl -s https://deb.nodesource.com/setup_18.x | sudo bash
apt install nodejs -y
apt install npm -y
npm install -g nodemon

# Clone reposiroty
git clone https://github.com/dochithanh2002/ChatGPT-for-Mobile-Notification.git /home/ubuntu/ChatGPT-for-Mobile-Notification

# Install nginx
apt install nginx -y
systemctl enable nginx
systemctl start nginx

# add sites configuration to nginx site-available
cp /home/ubuntu/ChatGPT-for-Mobile-Notification/configuration/grweb /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/grweb /etc/nginx/sites-enabled/grweb
rm /etc/nginx/sites-available/default 
unlink /etc/nginx/sites-enabled/default 
# reload and apply
nginx -s reload

# assign permission for ubuntu:ubuntu
chown ubuntu:ubuntu -R /home/ubuntu/ChatGPT-for-Mobile-Notification
cd /home/ubuntu/ChatGPT-for-Mobile-Notification
# instal packages and dependencies => start
npm install
npm start &
