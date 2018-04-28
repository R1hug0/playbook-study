#!/bin/bash
#make nginx 
cd  {{ nginx_makedir }}{{ nginx_version }}
./configure  \
--prefix={{ nginx_basedir }} 
--user={{ nginx_user }}  --group={{ nginx_user }} \
--with-http_v2_module \
--with-http_dav_module \
--with-http_flv_module  \
--with-http_realip_module \
--with-http_ssl_module \
--with-http_stub_status_module 
--with-http_ssl_module \
--with-pcre
--with-stream
make -j4 
make install
###init nginx db###"
mv /tmp/nginx.conf  {{ nginx_confdir }}nginx.conf
mv /tmp/sql.conf  {{ nginx_confdir }}sql.conf
chown {{ nginx_user }}:{{ nginx_user }}    {{ nginx_basedir }} -R
/etc/init.d/nginx start 
sleep 5
echo "export NGINX_HOME={{ nginx_basedir }}" >> /etc/profile
echo 'export PATH=$NGINX_HOME/bin:$PATH' >> /etc/profile
source /etc/profile
chown {{ nginx_user }}:{{ nginx_user }}  {{ nginx_basedir }} -R
rm -f /tmp/$(basename $0)
