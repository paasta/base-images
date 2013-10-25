#/bin/sh
set -e

if [ "$PACKER_BUILDER_TYPE" != "amazon-instance" ] && [ "$PACKER_BUILDER_TYPE" != "amazon-ebs" ]; then
  echo "Skipping"
  exit 0
fi

export DEBIAN_FRONTEND='noninteractive'

apt-get update -q
apt-get upgrade -qy

# Add multiverse for ec2-ami-tools
if [ "$PACKER_BUILDER_TYPE" = "amazon-instance" ]; then
  apt-get install -qy ec2-ami-tools
fi

