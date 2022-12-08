#SmartServer Linux Ubuntu 설치


#SmartServer Download
wget  http://www.processq.net/Download/Component/SmartServer.zip

#MariaDB Create Database SQL
wget http://www.processq.net/Download/Component/MariaTop_Comm.txt

# apt update
apt-get install -y zip
apt-get update

# SmartServer  Unzip
unzip -O cp949 SmartServer.zip
chmod 751 -R SmartServer

# JAVA Install
apt-get install -y openjdk-8-jdk

# MariaDB Install
apt-get install -y mariadb-server

# MariaDB my.cnf
wget http://www.processq.net/Download/Component/mariadb.cnf
cp ./mariadb.cnf  /etc/mysql/mariadb.cnf

# MariaDB  Restart
systemctl restart mariadb

# MariaDB  Create Database (TOP_COMM, DEV_DB )
mysql -u root < '/root/MariaTop_Comm.txt'

# Port Open
ufw allow 80

# Tomcat Start
nohup /root/SmartServer/WAS/bin/catalina.sh run &
