#!/bin/bash

set -e
set -x

# In Ubuntu 12.04, the contents of /var/lib/apt/lists are corrupt
ubuntu_version=$(lsb_release -r | awk '{ print $2 }')
if [ "$ubuntu_version" == '12.04' ]; then
	rm -rf /var/lib/apt/lists
fi

export DEBIAN_FRONTEND='noninteractive'

apt-get update -q

apt-get install -y curl