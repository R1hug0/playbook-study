#!/bin/bash
if [ ! -d '/usr/local/redis/bin' ]; then
echo "********check setup directroy********" > /tmp/redis.status
echo "redis setup failed!!" >> /tmp/redis.status
exit
fi
if [ ! -e "/etc/init.d/redis{{ redis_port1 }}" ]; then
echo "********start script1********" >> /tmp/redis.status
echo "redis start script no exist!!" >> /tmp/redis.status
fi
if [ ! -e "/etc/init.d/redis{{ redis_port2 }}" ]; then
echo "********start script2********" >> /tmp/redis.status
echo "redis start script no exist!!" >> /tmp/redis.status
fi
s1=`ps aux |grep {{ redis_port1 }} | grep -v "grep" | wc -l`
s2=`ps aux |grep {{ redis_port2 }} | grep -v "grep" | wc -l`
if [ $s1 -lt 1 ];then 
echo "********status********" >> /tmp/redis.status
echo "redis1 is not running!!" >> /tmp/redis.status
echo "try start redis program" >> /tmp/redis.status
/etc/init.d/redis{{ redis_port1 }} start
fi
if [ $s2 -lt 1 ];then 
echo "********status********" >> /tmp/redis.status
echo "redis2 is not running!!" >> /tmp/redis.status
echo "try start redis program" >> /tmp/redis.status
/etc/init.d/redis{{ redis_port2 }} start
fi
rm -f /tmp/$(basename $0)
