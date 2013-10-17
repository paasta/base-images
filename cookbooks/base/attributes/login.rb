default.base.login.user = nil
default.base.login.authorized_keys = nil

# Harden sshd
set.openssh.server.password_authentication = "no"
set.openssh.server.permit_root_login = "no"
