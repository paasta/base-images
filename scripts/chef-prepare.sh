#!/bin/sh
set -e

# Install chef
apt-get install -y curl
curl -L https://www.opscode.com/chef/install.sh | bash -s -- -v 11.6.0

# Install berkshelf because it takes a long time to do so
apt-get install -y build-essential
/opt/chef/embedded/bin/gem install berkshelf --no-ri --no-rdoc
ln -sf /opt/chef/embedded/bin/berks /usr/local/bin/berks
