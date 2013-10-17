#
# Cookbook Name:: base
# Recipe:: apt
#
# Copyright (C) 2013 Jonas Pfenniger
#

cookbook_file "/etc/apt/apt.conf.d/02compress-indexes" do
  owner "root"
  mode 0644
end

cookbook_file "/etc/apt/sources.list" do
  owner "root"
  mode 0644
end

include_recipe "apt"

