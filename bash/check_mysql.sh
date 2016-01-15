#!/bin/bash

###################
#
#  crontab 每分钟运行一次(*) 每五分钟一次(*/5)
#
###################

pgrep -x mysqld &> /dev/null

if [ $? -ne 0 ]

then

echo "At time: `date` :MySQL  is stop .">> /home/cqqh/bash/mysql_messages

#service mysql start
echo "At time: `date` :MySQL server is stop."
/etc/init.d/mysql start
else

echo "MySQL server is running ."

fi