#
# Cookbook Name:: base
# Recipe:: login
#
# Copyright (C) 2013 Jonas Pfenniger
#
# Sets up a proxy user for SSH login
#

return unless node.base.login.user

include_recipe "openssh"

### Login user config ###
# SSH as this user but automatically sudo su to root

cookbook_file "/bin/rootlogin" do
  mode 0755
end

file "/etc/sudoers.d/01-#{node.base.login.user}" do
  mode 0440
  content "#{node.base.login.user} ALL=(ALL) NOPASSWD:ALL\n"
end

user node.base.login.user do
  shell "/bin/rootlogin"
  action :create
end

directory "/home/#{node.base.login.user}" do
  mode 0755
end
directory "/home/#{node.base.login.user}/.ssh" do
  mode 0700
  owner node.base.login.user
  group node.base.login.user
end

authorized_keys = [
  node.base.login.public_keys,
  (File.read("/home/#{node.base.login.user}/.ssh/authorized_keys") rescue []),
  (File.read('/home/vagrant/.ssh/authorized_keys').split("\n") rescue []),
  (File.read('/home/ubuntu/.ssh/authorized_keys').split("\n") rescue [])
].flatten.compact.sort.uniq

file "/home/#{node.base.login.user}/.ssh/authorized_keys" do
  mode 0600
  owner node.base.login.user
  group node.base.login.user
  content authorized_keys.join("\n") + "\n"
end

# Make sure we don't allow to login with the ubuntu user
user "ubuntu" do
  action :remove
end
