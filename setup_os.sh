#!/bin/bash

# Install ngrok
cd ~
mkdir temp
cd temp
wget https://api.equinox.io/1/Applications/ap_pJSFC5wQYkAyI0FIVwKYs9h1hW/Updates/Asset/ngrok.zip?os=linux&arch=386&channel=stable
unzip ngrok.zip
mv ngrok /usr/local/bin/
ngrok -authtoken $NGROKTOKEN

# Install cron jobs
crontab -l > mycron
echo "@reboot ngrok -proto tcp $SSHPORT" >> mycron
crontab mycron
rm mycron

# Install virtual environment
sudo apt-get install python-pip
sudo pip install virtualenv

# Create directories
mkdir ~/.venvs
mkdir ~/workspace
