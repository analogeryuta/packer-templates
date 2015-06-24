#!/bin/sh

if [ -f /etc/system-release ]; then
  RELEASE=$(grep -o 'release .' /etc/system-release | cut -d ' ' -f 2)
  rpm -ivh "http://yum.puppetlabs.com/puppetlabs-release-el-${RELEASE}.noarch.rpm"
  yum -y install puppet facter
fi

if [ -f /etc/debian_version ]; then
  wget "https://apt.puppetlabs.com/puppetlabs-release-precise.deb" -P /tmp
  sudo dpkg -i /tmp/puppetlabs-release-precise.deb
  sudo apt-get update
  sudo apt-get -y install puppet facter
fi
