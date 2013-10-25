# Harden sshd
set.openssh.server.hostbased_authentication = "no"
set.openssh.server.password_authentication = "no"
set.openssh.server.permit_empty_passwords = "no"
set.openssh.server.permit_root_login = "no"
set.openssh.server.use_privilege_separation = "yes"
set.openssh.server.subsystem = "sftp /usr/lib/openssh/sftp-server"
