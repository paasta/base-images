#!/bin/sh
set -e

if [ "$PACKER_BUILDER_TYPE" != "virtualbox-iso" ] && [ "$PACKER_BUILDER_TYPE" != "vmware" ]; then
  echo "Skipping, $PACKER_BUILDER_TYPE is not our target"
  exit 0
fi

perl -p -i -e 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"/g'  /etc/default/grub
/usr/sbin/update-grub
