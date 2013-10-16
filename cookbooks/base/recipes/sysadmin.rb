#
# Cookbook Name:: base
# Recipe:: sysadmin
#
# Copyright (C) 2013 Jonas Pfenniger
#

# These are the tools that every sysadmin wants to have on his box

# Packages we want on all machines (as a sysadmin)
%w[
  bmon
  cbm
  curl
  htop
  iftop
  iotop
  ngrep
  netcat
  screen
  strace
  sysstat
].each{|p| package(p)}

# Too much data on login is not good
file "/etc/update-motd.d/10-help-text" do
  action :delete
end

# Message on login
template "/etc/update-motd.d/95-chef-deploy" do
  source "motd.erb"
  mode 0755
  backup 0
end

### Root user config ###

# Decent VIM config
package "vim-nox"
cookbook_file "/root/.vimrc" do
  source "vimrc"
  mode 0644
end
directory "/root/.vim" do
  mode 0755
end
directory "/root/.vim/swap" do
  mode 0755
end

# Use zsh
package "zsh"
user "root" do
  shell "/bin/zsh"
  action :modify
end
cookbook_file "/root/.zshrc" do
  source "zshrc"
  mode 0644
end
