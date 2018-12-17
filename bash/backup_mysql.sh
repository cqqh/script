#!/bin/bash

dbuser=dbuser
dbpwd=dbpwd
backupdir=/home/backup
table=phpquan
date=` date +%Y%m%d `

#record log
echo `date` start >> $backupdir/bakmysql.log

#本地备份
/usr/local/mysql/bin/mysqldump -u $dbuser -p$dbpwd $table --lock-tables=false | gzip > $backupdir/$date-phpquan.sql.gz

#scp异地备份
scp /home/backup/$date-phpquan.sql.gz user@phpquan.com:/mnt/disk/backup/mysql/$date-phpquan.sql.gz

#删除5天前的日志
find /home/backup/ -mtime +5 -name '*.sql.gz' -exec rm -rf {} \;

#record log
echo `date` finish >> $backupdir/bakmysql.log
