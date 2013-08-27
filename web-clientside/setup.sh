#! /usr/bin/env bash

apt-get update -y
apt-get install -y curl git vim screen fontconfig ruby1.9.1 tree

echo 'export LC_ALL=en_US.utf-8' >> /home/vagrant/.bashrc 
echo 'export LANG=\"$LC_ALL\"' >> /home/vagrant/.bashrc

git clone https://github.com/GordStephen/dotfiles.git /home/vagrant/.dotfiles
cd /home/vagrant/.dotfiles 
git submodule init
git submodule update
su - vagrant -c '.dotfiles/setup.sh'

su - vagrant -c '
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
source /home/vagrant/.nvm/nvm.sh
nvm install v0.10.17

npm install -g jshint phantomjs yo generator-angular generator-webapp
'
echo 'nvm use v0.10.17' >> /home/vagrant/.profile

gem install compass


