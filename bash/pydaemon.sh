#!/bin/bash


sn=`ps -ef |grep /home/hua/py/dnspod.py| grep -v grep |awk '{print $2}'`
if [ "${sn}" = "" ]    #如果为空,表示进程未启动
then
python /home/hua/py/dnspod.py
echo 'start ok !'
else
echo 'running'
fi
