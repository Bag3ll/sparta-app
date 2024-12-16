#!/bin/bash

# update
sudo apt update -y

# upgrade exclude debian
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# install nginx exclude debian
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y

# restart nginx
sudo systemctl restart nginx

# enable nginx
sudo systemctl enable nginx

# use curl to download the nodejs setup file
curl -fsSL https://deb.nodesource.com/setup_20.x -o setup_nodejs.sh

# run the setup file through bash
sudo DEBIAN_FRONTEND=noninteractive bash setup_nodejs.sh

# install nodejs
sudo DEBIAN_FRONTEND=noninteractive apt install nodejs -y

# install unzip
sudo DEBIAN_FRONTEND=noninteractive apt install unzip -y

# download sparta-app from github
git clone https://github.com/Bag3ll/sparta-app.git

# cd into sparta-app
cd sparta-app

# unzip folder
unzip nodejs20-sparta-test-app.zip

# go into app folder
cd app

# install app
npm install

# start app
npm start &

# show that the app is running
echo "Checking if the app is running..."
sleep 5
if curl -s http://localhost:3000 > /dev/null; then
    echo "App is running successfully on port 3000!"
else
    echo "Failed to start the app. Check logs for more details."
fi