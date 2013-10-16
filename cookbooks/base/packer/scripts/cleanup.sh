#!/bin/sh
set -e

# Remove items used for building, since they aren't needed anymore
echo "*** removing unnessary packages"
aptitude search ~i | grep linux-headers- | cut -d ' ' -f 2 | xargs dpkg -r
apt-get -y autoremove
aptitude purge -y ~c
apt-get clean

# Removing leftover leases and persistent rules
echo "*** cleaning up dhcp leases"
rm -f /var/lib/dhcp/*

# Make sure Udev doesn't block our network
# http://6.ptmc.org/?p=164
echo "*** cleaning up udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
echo "pre-up sleep 2" >> /etc/network/interfaces

# Everything is clear
echo -n > /var/lib/update-notifier/updates-available

# AWS builds the image separately and doesn't need the disc scrubbing
if [ "$PACKER_BUILDER_TYPE" = "amazon-instance" ] || [ "$PACKER_BUILDER_TYPE" = "amazon-ebs" ]; then
  exit 0
fi

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M || true
rm -f /EMPTY
