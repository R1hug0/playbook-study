#!/bin/bash
echo "********check setup directroy********" > /tmp/mysql.status
if [ ! -d '/usr/local/mysql/bin' ]; then
echo "mysql setup failed!!" >> /tmp/mysql.status
exit
fi
if [ ! -e '/etc/init.d/mysqld' ]; then
echo "********start script********" >> /tmp/mysql.status
echo "mysql start script no exist!!" >> /tmp/mysql.status
exit
fi
s=`ps aux |grep mysql | grep -v "grep" | wc -l`
if [ $s -eq 0 ];then 
echo "********status********" >> /tmp/mysql.status
echo "mysqld is not running!!" >> /tmp/mysql.status
echo "try start mysql program" >> /tmp/mysql.status
#/etc/init.d/mysqld restart
fi



