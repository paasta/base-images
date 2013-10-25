#
# Cookbook Name:: base
# Recipe:: packages
#
# Copyright (C) 2013 Jonas Pfenniger
#

# Make sure the machine's time is in sync
package "chrony"

# Base python packages
package "ipython"
package "python-pip"
package "python-virtualenv"

# Packages we don't want
%w[
  apport
  ufw
  whoopsie
].each{|p| dpkg_package(p){ action(:purge) } }
