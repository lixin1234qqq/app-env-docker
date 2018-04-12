#!/bin/bash

case "$1" in
    start)
        chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
		nohup mysqld_safe --datadir=/var/lib/mysql &>/dev/null &

		echo '[-] Waiting for MySQL to start ...'
		while true
		do
			mysql -uroot -e 'select 1' &>/dev/null && break
			sleep 1
		done
    ;;
    stop)
        killall -9 mysqld
    ;;
    restart)
		$0 stop
		$0 start
	;;
    *)
		echo Unknown action: $1
	;;

esac