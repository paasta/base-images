#!/bin/sh
set -e

date > /etc/build_time

# Prepare the system's package-manager and make it
# minimal.

# Compress apt indexes
cat <<EOF > /etc/apt/apt.conf.d/02compress-indexes
Acquire::GzipIndexes "true";
Acquire::CompressionTypes::Order:: "gz";
EOF

# Configure the source
cat <<EOF > /etc/apt/sources.list
deb http://us.archive.ubuntu.com/ubuntu/ precise main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu/ precise-updates main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu precise-security main restricted universe multiverse
EOF

apt-get update -qy

