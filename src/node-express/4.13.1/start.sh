#!/bin/bash

echo
echo '[-] Starting MariaDB'
nohup mysqld_safe --datadir=/var/lib/mysql &>/dev/null &

echo '[-] Waiting for MySQL to start ...'
while true
do
	mysql -uroot -e 'select 1' &>/dev/null && break
done

echo '[-] Starting Express server'
echo '    - Logging to server.log'
cd /tmp/express-4.13.1/examples/static-files/
nohup node index.js &> server.log &

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

/bin/bash
