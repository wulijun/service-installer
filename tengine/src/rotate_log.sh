#!/bin/bash
# nginx log rotate
# crontab Example:
# 0 0 * * 1 /home/worker/nginx/sbin/rotate_logs.sh > /dev/null 2>&1
###################################################################
trap '' 1 2 3 15
PATH=$PATH:.
CURPATH=$(dirname $(which $0))
ROOTPATH=$(dirname ${CURPATH})
LOGPATH="${ROOTPATH}/logs"
BACKLOGPATH="${LOGPATH}/backup"
mkdir -p $BACKLOGPATH

pidfile="${ROOTPATH}/logs/nginx.pid"
nginx="${ROOTPATH}/sbin/nginx"
logfiles="${LOGPATH}/access_log ${LOGPATH}/error_log ${LOGPATH}/access.log ${LOGPATH}/error.log"

suffix=$(date +%Y%m%d%H%M%S)
for logfile in $logfiles
do
  if [ ! -f $logfile ]; then echo "$logfile not exists"; continue;fi
  if [ ! -s $logfile ]; then echo "$logfile is empty, skipped"; continue;fi
  echo $logfile "$BACKLOGPATH/$(basename $logfile).${suffix}"
  mv $logfile "$BACKLOGPATH/$(basename $logfile).${suffix}" > /dev/null 2>&1
done

$nginx -s reopen

#find $LOGPATH -maxdepth 1 -type f -name "*_log|*.log$" -size +0
