#
# Cookbook Name:: base
# Recipe:: app
#
# Copyright (C) 2013 Jonas Pfenniger
#

user "app" do
  comment "User for app runtime"
  home "/home/app"
  shell "/bin/bash"
  supports manage_home: true
end

# Misc
package "git"
package "curl"

