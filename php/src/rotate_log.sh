#!/bin/bash
# php log rotate
# crontab Example:
# 0 0 * * 1 /home/worker/php5/sbin/rotate_logs.sh > /dev/null 2>&1
###################################################################
trap '' 1 2 3 15
PATH=$PATH:.
CURPATH=$(dirname $(which $0))
ROOTPATH=$(dirname ${CURPATH})
LOGPATH="${ROOTPATH}/var/log"
BACKLOGPATH="${LOGPATH}/backup"
mkdir -p $BACKLOGPATH

pidfile="${ROOTPATH}/var/run/php-fpm.pid"
logfiles="${LOGPATH}/php_error.log ${LOGPATH}/php-fpm.log ${LOGPATH}/www.log.slow"

suffix=$(date +%Y%m%d%H%M%S)
for logfile in $logfiles
do
  if [ ! -f $logfile ]; then echo "$logfile not exists"; continue;fi
  if [ ! -s $logfile ]; then echo "$logfile is empty, skipped"; continue;fi
  echo $logfile "$BACKLOGPATH/$(basename $logfile).${suffix}"
  mv $logfile "$BACKLOGPATH/$(basename $logfile).${suffix}" > /dev/null 2>&1
done

if [ ! -r $php_fpm_PID ] ; then
  echo "warning, no pid file found - php-fpm is not running ?"
  exit 1
fi
kill -USR1 `cat $pidfile`

#find $LOGPATH -maxdepth 1 -type f -name "*_log|*.log$" -size +0
