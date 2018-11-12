#!/bin/bash

# This is the setup script for the dev environment. You can spin up the
# environment with `vagrant up` on the command line.

# Setup Python3 and virtualenv
sudo apt-get install python3-setuptools -y
sudo apt-get install python3-dev -y
sudo apt-get install gc, g++ -y
sudo apt-get install python-dev build-essential libssl-dev libffi-dev \
  libxml2-dev libxslt1-dev zlib1g-dev python-pip -y

sudo easy_install3 pip
sudo pip install virtualenv
sudo pip install virtualenvwrapper

echo 'export VIRTUALENVWRAPPER_PYTHON="$(command \which python3)"' >> ~/.profile
echo 'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.profile
echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.profile

# Activate the profile
source ~/.profile

# Make a virtual environment
mkvirtualenv --python=/usr/bin/python3 economicallywoke

# Set the working directory for the virtual env
echo 'cd /vagrant' >> ~/.virtualenvs/economicallywoke/bin/postactivate

# Drop into the virtualenv
workon economicallywoke

# Install the python requirements
pip install -r /vagrant/requirements.txt

# Make sure we always drop into the virtualenv whenever we ssh into the box
echo 'workon economicallywoke' >> ~/.profile
