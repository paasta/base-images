#
# Cookbook Name:: base
# Recipe:: sysadmin
#
# Copyright (C) 2013 Jonas Pfenniger
#

include_recipe "logrotate"

# Remove old useless logs
bash "rsyslog_remove_old_logs" do
  user "root"
  code <<-EOH
rm -rf \
  /var/log/lpr.log* \
  /var/log/mail.err* /var/log/mail.info* /var/log/mail.warn* \
  /var/log/news \
  /var/log/user.log* \
  /var/log/syslog*
  EOH
  action :nothing
end

package "rsyslog" do
  action :install
end

service "rsyslog" do
  supports :restart => true, :reload => true
  action [:enable, :start]
  notifies :run, "bash[rsyslog_remove_old_logs]", :delayed
end

cookbook_file "/etc/default/rsyslog" do
  source "rsyslog.default"
  owner "root"
  group "root"
  mode 0644
end

include_recipe "logrotate"
cookbook_file "/etc/logrotate.d/rsyslog" do
  source "rsyslog.logrotate"
  owner "root"
  group "root"
  mode 0644
end

directory "/etc/rsyslog.d" do
  owner "root"
  group "root"
  mode 0755
end

directory "/var/spool/rsyslog" do
  owner "syslog"
  group "syslog"
  mode 0755
end

cookbook_file "/etc/rsyslog.conf" do
  source "rsyslog.conf"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[rsyslog]", :delayed
end

cookbook_file "/etc/rsyslog.d/50-default.conf" do
  source "50-default.conf"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[rsyslog]", :delayed
end

if node.base.loghost
  # Setup forwarding
  template '/etc/rsyslog.d/99-forwarding.conf' do
    source 'rsyslog-forwarding.erb'
    variables(loghost: node.base.loghost)
    mode 0644
    notifies :restart, "service[rsyslog]", :delayed
  end
else
  # Remove forwarding
  file '/etc/rsyslog.d/99-forwarding.conf' do
    action :delete
    notifies :restart, "service[rsyslog]", :delayed
  end
end
