#/bin/sh
set -e

if [ "$PACKER_BUILDER_TYPE" != "amazon-instance" ] && [ "$PACKER_BUILDER_TYPE" != "amazon-ebs" ]; then
  echo "Skipping"
  exit 0
fi

# Add multiverse for ec2-ami-tools
cat <<APT_SOURCE > /etc/apt/sources.list
deb http://us.archive.ubuntu.com/ubuntu/ precise main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu/ precise-updates main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu precise-security main restricted universe multiverse
APT_SOURCE

apt-get update -y

if [ "$PACKER_BUILDER_TYPE" = "amazon-instance" ]; then
  apt-get install -y ec2-ami-tools
fi

