#!/usr/bin/bash
apt update -y ; apt dist-upgrade -y ; apt full-upgrade -y
update-rc.d -f ssh remove
update-rc.d -f ssh defaults
cd /etc/ssh ; mkdir old_ssh_keys ; mv ssh_host* old_ssh_keys
ls .
dpkg-reconfigure openssh-server
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
service ssh restart
update-rc.d ssh enable 2 3 4 5
echo "This is Kali , not a toy , use wisely and be responsible with your actions!!!! " >> /etc/motd
service ssh restart
