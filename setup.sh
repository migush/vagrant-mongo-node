#!/bin/bash
color() {
      printf '\033[%sm%s\033[m\n' "$@"
      # usage color "31;5" "string"
      # 0 default
      # 5 blink, 1 strong, 4 underlined
      # fg: 31 red,  32 green, 33 yellow, 34 blue, 35 purple, 36 cyan, 37 white
      # bg: 40 black, 41 red, 44 blue, 45 purple
      }

color '36;1' "

     This script installs dependencies for nodejs.

"

color '35;1' 'Updating packages...'
apt-get update

color '35;1' 'Installing dependencies from apt-get...'

apt-get -y install git \
                   wget \
                   curl \
                   stow \
                   build-essential \
                   gcc \
                   g++ \
                   libgmp3-dev \
                   libavahi-compat-libdnssd-dev \
                   imagemagick

color '35;1' 'Installing Node.js...'
curl -sL https://deb.nodesource.com/setup | bash -
apt-get install -y nodejs

color "35;1" "Installing mongodb..."
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
apt-get update
apt-get install -y mongodb-org

color '35;1' 'Cleaning up...'
apt-get -y autoremove

color '35;1' 'Installing nodejs dependencies'
cd /vagrant
sudo -H -u vagrant npm install

color '35;1' 'Done!'
