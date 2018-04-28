#!/bin/bash
if [ ! -d '/usr/local/zabbix/sbin' ]; then
echo "********check setup directroy********" > /tmp/zabbix.status
echo "zabbix setup failed!!" >> /tmp/zabbix.status
exit
fi
if [ ! -e '/etc/init.d/zabbix_server' ]; then
echo "********start script********" >> /tmp/zabbix.status
echo "zabbix start script no exist!!" >> /tmp/zabbix.status
fi
s=`ps aux |grep zabbix | grep -v "grep" | wc -l`
if [ $s -lt 1 ];then 
echo "********status********" >> /tmp/zabbix.status
echo "zabbix is not running!!" >> /tmp/zabbix.status
echo "try start zabbix program" >> /tmp/zabbix.status
fi
cat /tmp/zabbix.status
