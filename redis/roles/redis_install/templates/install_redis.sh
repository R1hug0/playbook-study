#!/bin/bash
cd  {{ redis_makedir }}{{ redis_version }}
./configure
make -j4 
make PREFIX=/usr/local/redis install
###init redis db###"
mv /tmp/redis{{ redis_port1 }}.conf  {{ redis_confdir }}redis{{ redis_port1 }}.conf
mv /tmp/redis{{ redis_port2 }}.conf  {{ redis_confdir }}redis{{ redis_port2 }}.conf
chmod +x /etc/init.d/redis{{ redis_port1 }}
chmod +x /etc/init.d/redis{{ redis_port2 }}
chown {{ redis_user }}:{{ redis_user }}    {{ redis_basedir }} -R
/etc/init.d/redis{{ redis_port1 }} start 
/etc/init.d/redis{{ redis_port2 }} start 
sleep 5
echo "export REDIS_HOME={{ redis_basedir }}" >> /etc/profile
echo 'export PATH=$REDIS_HOME/bin:$PATH' >> /etc/profile
echo "vm.overcommit_memory = 1"  >> /etc/sysctl.conf
sysctl -p
source /etc/profile
cat > /etc/logrotate.d/redis <<EOF
/usr/local/redis/log/redis*.log {
    daily
    rotate 7 
    copytruncate
    delaycompress
    compress
    notifempty
    missingok
}
EOF
chown {{ redis_user }}:{{ redis_user }}  {{ redis_basedir }} -R
rm -f /tmp/$(basename $0)
