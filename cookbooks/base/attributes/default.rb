default.base.hostname = (node['ec2'] && node['ec2']['instance_id']) || node['hostname']

default.base.login.user = nil
default.base.login.public_keys = []
set.openssh.server.password_authentication = "no"

default.base.loghost = nil
