#!/bin/bash
#make mongodb 
mv {{ mongodb_makedir }}{{ mongodb_version }} /usr/local/mongodb
mkdir {{ mongodb_confdir }}
mkdir {{ mongodb_logdir }}
###init mongodb db###"
mv /tmp/mongod.conf  {{ mongodb_confdir }}mongod.conf
chown {{ mongodb_user }}:{{ mongodb_user }}  {{ mongodb_basedir }} -R
chown {{ mongodb_user }}:{{ mongodb_user }}  {{ mongodb_datadir }} -R
chown {{ mongodb_user }}:{{ mongodb_user }}  {{ mongodb_logdir }} -R
touch {{ mongodb_logdir }}mongod.log 
/etc/init.d/mongod start 
sleep 5
echo "export MONGODB_HOME={{ mongodb_basedir }}" >> /etc/profile
echo 'export PATH=$MONGODB_HOME/bin:$PATH' >> /etc/profile
source /etc/profile
chown {{ mongodb_user }}:{{ mongodb_user }}  {{ mongodb_basedir }} -R
/etc/init.d/mongod restart 
rm -f /tmp/$(basename $0)
