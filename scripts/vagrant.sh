#!/bin/sh
set -e

if [ "$PACKER_BUILDER_TYPE" != "virtualbox" ] && [ "$PACKER_BUILDER_TYPE" != "vmware" ]; then
  echo "Skipping, $PACKER_BUILDER_TYPE is not our target"
  exit 0
fi

# Set up sudo
echo %vagrant ALL=NOPASSWD:ALL > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

# Setup sudo to allow no-password sudo for "sudo"
usermod -a -G sudo vagrant

# Installing vagrant keys
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Install NFS for vagrant
apt-get -y install nfs-common
