# Centos build script

# Need to install ibjpeg and zlib Pillow
yum update -y
hostnamectl set-hostname ctm-web
more /etc/hosts
timedatectl set-timezone 'Europe/London'
date
yum install -y yum-cron
sed -i.bak 's|apply_updates = no|apply_updates = yes|' /etc/yum/yum-cron.conf
echo "Set yum to autoupdate"
# TODO: Verify not required and can be removed
# rpm -Uvh https://www.softwarecollections.org/en/scls/rhscl/python33/epel-7-x86_64/download/rhscl-python33-epel-7-x86_64.noarch.rpm
yum install -y epel-release
yum install -y python36
yum install -y python36u-wheel
yum install -y python-pip
yum install -y git
yum install -y python-imaging
yum install -y python-psycopg2
yum install -y python36-python-psycopg2
yum install -y fail2ban
yum install -y sendmail
systemctl start fail2ban
systemctl enable fail2ban
systemctl start sendmail
systemctl enable sendmail
pip install virtualenv

# Create virtualenv
echo "UPDATE to create service user"
# Create a Python virtual Environment
virtualenv --python=python3 venv
# Activate virtualenv
source venv/bin/activate
# Install third party python packages
pip install -r /vagrant/src/check_the_map/requirements.txt