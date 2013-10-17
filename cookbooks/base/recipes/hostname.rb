#
# Cookbook Name:: base
# Recipe:: hostname
#
# Copyright (C) 2013 Jonas Pfenniger
#

file "/etc/hostname" do
  mode 0644
  content "#{node.base.hostname}\n"
end

template "/etc/hosts" do
  mode 0644
  source "hosts.erb"
  variables hostname: node.base.hostname
end

if node.hostname != node.base.hostname
  execute "hostname -b -F /etc/hostname"
  ohai "reload"
end
