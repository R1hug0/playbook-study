#!/bin/bash
mv /tmp/my.cnf /etc/my.cnf
#make mysql 
cd  {{ mysql_makedir }}/{{ mysql_version }}
cmake   \
			-DCMAKE_INSTALL_PREFIX={{ mysql_basedir }} \
			-DMYSQL_DATADIR={{ mysql_datadir }} \
			-DSYSCONFDIR=/etc \
			-DWITH_MYISAM_STORAGE_ENGINE=1 \
			-DWITH_INNOBASE_STORAGE_ENGINE=1 \
			-DWITH_MEMORY_STORAGE_ENGINE=1 \
			-DWITH_READLINE=1 \
			-DMYSQL_UNIX_ADDR={{ mysql_sock }} \
			-DMYSQL_TCP_PORT=3306 \
			-DENABLED_LOCAL_INFILE=1 \
			-DWITH_PARTITION_STORAGE_ENGINE=1 \
			-DEXTRA_CHARSETS=all \
			-DDEFAULT_CHARSET=utf8 \
			-DDEFAULT_COLLATION=utf8_general_ci
make -j4 
make install
touch  {{ mysql_datadir }}/{{ mysql_sock }}
chown {{ mysql_user }}:{{ mysql_user }}  -R  {{ mysql_datadir }}
###init mysql db###"
{{ mysql_basedir }}/scripts/mysql_install_db --defaults-file=/etc/my.cnf --basedir={{ mysql_basedir }} --datadir={{ mysql_datadir }} --user={{ mysql_user }} >> /dev/null 2>&1 
/etc/init.d/mysqld start 
sleep 5
#rm -rf /usr/bin/mysql /usr/bin/mysql_config
#ln -s {{ mysql_basedir }}/bin/mysql /usr/bin/mysql
#ln -s {{ mysql_basedir }}/bin/mysql_config /usr/bin/mysql_config
ln -s {{ mysql_sock }} /tmp/mysql.sock
echo "export MYSQL_HOME={{ mysql_basedir }}" >> /etc/profile
echo 'export PATH=$MYSQL_HOME/bin:$PATH' >> /etc/profile
source /etc/profile
echo "{{ mysql_basedir }}/lib/" >>/etc/ld.so.conf
/sbin/ldconfig
chkconfig --add mysqld
rm -f /tmp/$(basename $0)
