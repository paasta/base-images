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
