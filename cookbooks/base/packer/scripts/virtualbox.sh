#!/bin/sh
set -e

if [ "$PACKER_BUILDER_TYPE" != "virtualbox" ]; then
  echo "Skipping, $PACKER_BUILDER_TYPE is not our target"
  exit 0
fi

# Without libdbus virtualbox would not start automatically after compile
apt-get install -y --no-install-recommends libdbus-1-3
apt-get install -y dkms linux-headers-$(uname -r)

# Installing the virtualbox guest additions
mount -o loop VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run --nox11 || true
umount /mnt

rm VBoxGuestAdditions.iso
