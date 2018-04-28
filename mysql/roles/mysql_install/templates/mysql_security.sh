#!/bin/bash
#{{ mysql_basedir }}/bin/mysql -h localhost -u root -S {{ mysql_sock }} -e "grant all privileges on *.* to {{ mysql_database_user }}@'{{ ansible_default_ipv4.address }}' identified by '{{ mysql_passwd }}' with grant option;"
{{ mysql_basedir }}/bin/mysql -hlocalhost -uroot -S{{ mysql_sock }} -e "grant all privileges on *.* to {{ mysql_database_user }}@'localhost' identified by '{{ mysql_passwd }}' with grant option;"
#{{ mysql_basedir }}/bin/mysql -h localhost -u root -S {{ mysql_sock }} -e "grant PROCESS,REPLICATION CLIENT ON *.* TO 'zabbix'@'%' identified BY 'zabbix';"
{{ mysql_basedir }}/bin/mysql -hlocalhost -uroot -p{{ mysql_passwd }} -S{{ mysql_sock }} -e "delete from mysql.user where password='';"
{{ mysql_basedir }}/bin/mysql -hlocalhost -uroot -p{{ mysql_passwd }} -S{{ mysql_sock }} -e "flush privileges;"
