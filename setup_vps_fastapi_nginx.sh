# Install NodeJS and PM2
yum install -y gcc-c++ make;
curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -;
sudo yum install -y nodejs; npm i -g pm2;

# Install Nginx
sudo yum install -y epel-release;
sudo yum install -y nginx;
sudo systemctl start nginx;
sudo systemctl enable nginx;
sudo systemctl status nginx;

# Open Port 80, 443
systemctl stop firewalld;
systemctl mask firewalld;
yum install -y iptables-services;
iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT;
iptables -I INPUT -p tcp -m tcp --dport 443 -j ACCEPT;
service iptables save;
service iptables restart;

# Install Python3.7.9
sudo yum -y install wget make gcc openssl-devel bzip2-devel;
wget https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tgz;
tar xzf Python-3.7.9.tgz;
cd Python-3.7.9;
./configure --enable-optimizations;
sudo make altinstall;
sudo ln -sfn /usr/local/bin/python3.7 /usr/bin/python3.7;
sudo ln -sfn /usr/local/bin/pip3.7 /usr/bin/pip3.7;
rm -rf ~/Python-3.7.9;
rm -rf ~/Python-3.7.9.tgz;
cd ~;
