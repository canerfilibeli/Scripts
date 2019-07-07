#!/usr/bin/bash
apt update -y ; apt dist-upgrade -y ; apt full-upgrade -y
update-rc.d -f ssh remove
update-rc.d -f ssh defaults
cd /etc/ssh ; mkdir old-ssh-keys ; mv ssh_host_* old-ssh-keys
ls .
dpkg-reconfigure  openssh-server
#sed -i '/^PermitRootLogin/s/without-password/yes/' /etc/ssh/sshd_config
echo "PermitRootLogin  yes" >> /etc/ssh/sshd_config
service ssh restart
update-rc.d ssh enable 2 3 4 5 
echo "Kali VM . Not a toy, use wisely" > /etc/motd
service ssh restart
