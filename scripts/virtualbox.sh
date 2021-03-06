#!/bin/sh
set -e

if [ "$PACKER_BUILDER_TYPE" != "virtualbox" ]; then
  echo "Skipping, $PACKER_BUILDER_TYPE is not our target"
  exit 0
fi

export DEBIAN_FRONTEND='noninteractive'

# Without libdbus virtualbox would not start automatically after compile
apt-get install -qy --no-install-recommends libdbus-1-3
apt-get install -qy dkms linux-headers-$(uname -r)
apt-get install -qy autoconf

# Installing the virtualbox guest additions
mount -o loop VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run --nox11 || true
umount /mnt

rm VBoxGuestAdditions.iso
