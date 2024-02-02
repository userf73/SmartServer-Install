#SmartServer Linux CentOS 설치

#wget Install
yum install -y wget

#SmartServer Download
wget http://www.processq.net/Download/Component/SmartServer.zip

#MariaDB Create Database SQL
wget http://www.processq.net/Download/Component/MariaTop_Comm.txt

# unzip install
yum install -y unzip

# SmartServer  Unzip
unzip -O cp949 SmartServer.zip
chmod 751 -R SmartServer

# JAVA Install
yum install -y java-1.8.0-openjdk

# MariaDB Install
yum install -y mariadb-server

# MariaDB my.cnf
wget http://www.processq.net/Download/Component/my.cnf
yes | cp ./my.cnf  /etc/my.cnf

# MariaDB  Restart
systemctl restart mariadb

# MariaDB  Create Database (TOP_COMM, DEV_DB )
mysql -u root < '/root/MariaTop_Comm.txt'

# Port Open
yum install -y firewalld
systemctl enable firewalld
systemctl start firewalld
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --reload

# Tomcat Start
/startup.sh
