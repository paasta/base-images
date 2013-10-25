#
# Cookbook Name:: base
# Recipe:: ansible
#
# Copyright (C) 2013 Jonas Pfenniger
#

apt_repository "rquillo-ansible-#{node['lsb']['codename']}" do
  uri          'http://ppa.launchpad.net/rquillo/ansible/ubuntu'
  distribution node['lsb']['codename']
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'D664CA69B53A79125B2593E16425F1DA5504681D'
end

package "ansible"

# Used by Ansible accelerate mode
package "python-keyczar"

