#!/usr/bin/env bash

cd /vagrant/

# Only download Scripts Repository if not done before
if [ ! -d "/vagrant/vm-files"  ]; then
  git clone https://github.com/eveseat/scripts vm-files
fi

#cd /vagrant/vm-files/docker-compose-dev

# Only run the prepare-script if not run before
if [ ! -d "/vagrant/vm-files/docker-compose-dev/seat" ]; then
  cd /vagrant/vm-files/docker-compose-dev/
  echo "running prepare script"
  bash prepare-source.sh
fi

# Copy the .env for docker-compose to the home directory.
# Fix found here: https://github.com/leighmcculloch/vagrant-docker-compose/issues/43#issuecomment-272643635
cp /vagrant/vm-files/docker-compose-dev/.env /home/vagrant
