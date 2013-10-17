#
# Cookbook Name:: base
# Recipe:: berkshelf
#
# Copyright (C) 2013 Jonas Pfenniger
#

prefix = "/opt/chef/embedded/bin"

package "build-essential"

gem_package "berkshelf" do
  gem_binary File.join(prefix, "gem")
  version node.base.berkshelf_version
end

link "/usr/local/bin/berks" do
  to File.join(prefix, "berks")
end

