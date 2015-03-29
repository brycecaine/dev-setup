#!/bin/bash

# Create virtual environment
cd ~/.venvs
virtualenv $1
source ~/.venvs/$1/bin/activate

# Clone app repo
cd ~/workspace
git clone git@github.com:brycecaine/$1.git
cd $1

# Install python packages
pip install -r requirements.txt
