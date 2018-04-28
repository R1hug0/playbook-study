#!/bin/bash
if [ ! -d '/usr/local/zookeeper/bin' ]; then
echo "********check setup directroy********" > /tmp/zookeeper.status
echo "zookeeper setup failed!!" >> /tmp/zookeeper.status
exit
fi
s1=`ps aux |grep zookeeper |grep "{{ zookeeper_version }}" grep -v "grep" | wc -l`
if [ $s1 -lt 1 ];then 
echo "********status********" >> /tmp/zookeeper.status
echo "zookeeper is not running!!" >> /tmp/zookeeper.status
echo "try start zookeeper program" >> /tmp/zookeeper.status
{{ zookeeper_basedir }}/bin/zkServer.sh start 
fi
rm -f /tmp/$(basename $0)
