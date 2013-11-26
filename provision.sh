#!/usr/bin/env bash

if [ -f "/var/vagrant_provision" ]; then
	exit 0
fi


wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb >/dev/null 2>&1
sudo dpkg -i puppetlabs-release-precise.deb -y >/dev/null 2>&1
apt-get update >/dev/null 2>&1
sudo apt-get -y install puppet >/dev/null 2>&1

echo "LS_COLORS='di=1;33' ; export LS_COLORS" >> ~/.bashrc 


touch /var/vagrant_provision
echo "------------------------------------------------"
echo "Installation is done"
