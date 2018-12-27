#########################################################################
# File Name: 守护进程
# Author: cqqh
#########################################################################
#!/bin/bash

PIDFILE=/tmp/deamon_163mail.lock
if [ x"$1" = x-daemon ]; then
  if test -f "$PIDFILE"; then exit; fi
  echo $$ > "$PIDFILE"
  trap "rm '$PIDFILE'" EXIT SIGTERM
  while true; do

    #bj2_163
    sn=`ps aux | grep 'auto_ucloud_bj2_163.php' | grep -v grep | awk '{print $2}'`
    echo $sn
    if [ "${sn}" = "" ]    #如果为空,表示进程未启动
    then
    nohup php /home/wwwroot/edm.msd/affair/auto_ucloud_bj2_163.php >> /home/cqqh/ucloud_163.log & #后台启动进程
    echo start ok !
    else
    echo auto_ucloud_bj2_163.php mail running
    fi

    #mail
    sn=`ps aux | grep 'auto_ucloud_163.php mail' | grep -v grep | awk '{print $2}'`
    echo $sn
    if [ "${sn}" = "" ]    #如果为空,表示进程未启动
    then
    nohup php /home/wwwroot/fajianbao.msd/affair/auto_ucloud_163.php mail >> /home/cqqh/ucloud_163.log & #后台启动进程
    echo start ok !
    else
    echo auto_ucloud_163.php mail running
    fi

    #mx1
    sn=`ps aux | grep 'auto_ucloud_163.php mx1' | grep -v grep | awk '{print $2}'`
    echo $sn
    if [ "${sn}" = "" ]    #如果为空,表示进程未启动
    then
    nohup php /home/wwwroot/fajianbao.msd/affair/auto_ucloud_163.php mx1 >> /home/cqqh/ucloud_163.log & #后台启动进程
    echo start ok !
    else
    echo auto_ucloud_163.php mx1 running
    fi

    #mx2
    sn=`ps aux | grep 'auto_ucloud_163.php mx2' | grep -v grep | awk '{print $2}'`
    echo $sn
    if [ "${sn}" = "" ]    #如果为空,表示进程未启动
    then
    nohup php /home/wwwroot/fajianbao.msd/affair/auto_ucloud_163.php mx2 >> /home/cqqh/ucloud_163.log & #后台启动进程
    echo start ok !
    else
    echo auto_ucloud_163.php mx2 running
    fi

    #yjt_mail
    sn=`ps aux | grep 'auto_ucloud_bj1_163.php yjt_mail' | grep -v grep | awk '{print $2}'`
    echo $sn
    if [ "${sn}" = "" ]    #如果为空,表示进程未启动
    then
    nohup php /home/wwwroot/youjiantong.msd/affair/auto_ucloud_bj1_163.php yjt_mail >> /home/cqqh/ucloud_163.log & #后台启动进程
    echo start ok !
    else
    echo auto_ucloud_bj1_163.php yjt_mail running
    fi
    
    #yjt_mx1
    sn=`ps aux | grep 'auto_ucloud_bj1_163.php yjt_mx1' | grep -v grep | awk '{print $2}'`
    echo $sn
    if [ "${sn}" = "" ]    #如果为空,表示进程未启动
    then
    nohup php /home/wwwroot/youjiantong.msd/affair/auto_ucloud_bj1_163.php yjt_mx1 >> /home/cqqh/ucloud_163.log & #后台启动进程
    echo start ok !
    else
    echo auto_ucloud_bj1_163.php yjt_mx1 running
    fi

    #analysis
    sn=`ps aux | grep 'analysis_log_ucloud_163.php' | grep -v grep | awk '{print $2}'`
    echo $sn
    if [ "${sn}" = "" ]    #如果为空,表示进程未启动
    then
    nohup php /home/wwwroot/edm.msd/affair/analysis_log_ucloud_163.php >> /home/cqqh/msd_analysis_ucloud_163.log & #后台启动进程
    echo start ok !
    else
    echo analysis_log_ucloud_163.php running
    fi

    sleep 600
  done
elif [ x"$1" = x-stop ]; then
  sn=`ps aux | grep 'auto_ucloud_bj2_163.php' | grep -v grep | awk '{print $2}'`
  if [ -n "$sn" ]; then
    kill -9 $sn
  fi
  sn=`ps aux | grep 'auto_ucloud_163.php mail' | grep -v grep | awk '{print $2}'`
  if [ -n "$sn" ]; then
    kill -9 $sn
  fi
  sn=`ps aux | grep 'auto_ucloud_163.php mx1' | grep -v grep | awk '{print $2}'`
  if [ -n "$sn" ]; then
    kill -9 $sn
  fi
  sn=`ps aux | grep 'auto_ucloud_163.php mx2' | grep -v grep | awk '{print $2}'`
  if [ -n "$sn" ]; then
    kill -9 $sn
  fi
  sn=`ps aux | grep 'auto_ucloud_bj1_163.php yjt_mail' | grep -v grep | awk '{print $2}'`
  if [ -n "$sn" ]; then
    kill -9 $sn
  fi
  sn=`ps aux | grep 'auto_ucloud_bj1_163.php yjt_mx1' | grep -v grep | awk '{print $2}'`
  if [ -n "$sn" ]; then
    kill -9 $sn
  fi
  
  kill -9 `cat "$PIDFILE"`
  rm "$PIDFILE"
else
  nohup "$0" -daemon &
fi
