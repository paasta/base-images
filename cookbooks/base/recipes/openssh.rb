#
# Cookbook Name:: base
# Recipe:: openssh
#
# Copyright (C) 2013 Jonas Pfenniger
#
# Sets up openssh on the host
#

include_recipe "openssh"

cookbook_file "/etc/pam.d/sshd" do
  source "pam-sshd"
  owner "root"
  mode 0644
end

