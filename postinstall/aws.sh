#!/bin/sh
#

# CentOS AMI on AWS Marketplace by centos.org
if [ -f /etc/centos-release ]; then
  # Setting timezone
  ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
  sed -i 's:UTC:Asia/Tokyo:' /etc/sysconfig/clock

  # Remove default authorized keys to set EC2 keypair
  #   - http://qiita.com/ikuyamada/items/97c286990adfe1770acf
  rm -f /root/.ssh/authorized_keys
fi
