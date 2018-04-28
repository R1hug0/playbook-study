#!/bin/bash
#make zabbix 
cd  {{ zabbix_makedir }}{{ zabbix_version }}
./configure --prefix={{ zabbix_basedir }}  --enable-server --enable-proxy --enable-agent  --enable-ipv6     --with-net-snmp   --with-libcurl  --with-libxml2 --with-openipmi  --with-unixodbc --with-ldap  --with-ssh2  --enable-java   --with-mysql  --enable-static
make install
###init zabbix db###"
cp -rf frontends/php/* {{ zabbix_frontenddir }}
mv /tmp/zabbix_server.conf  {{ zabbix_confdir }}zabbix_server.conf
chown {{ zabbix_user }}:{{ zabbix_user }}    {{ zabbix_basedir }} -R
chown {{ zabbix_user }}:{{ zabbix_user }}    {{ zabbix_frontenddir }} -R
mysql -e "create database zabbix character set utf8;"
mysql -e "grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix'; flush privileges;"
mysql -uroot zabbix < database/mysql/schema.sql
mysql -uroot zabbix < database/mysql/images.sql 
mysql -uroot zabbix < database/mysql/data.sql 
/etc/init.d/zabbix_server start 
sleep 5
echo "export ZABBIX_HOME={{ zabbix_basedir }}" >> /etc/profile
echo 'export PATH=$ZABBIX_HOME/bin:$PATH' >> /etc/profile
source /etc/profile
chown {{ zabbix_user }}:{{ zabbix_user }}  {{ zabbix_basedir }} -R
rm -f /tmp/$(basename $0)
