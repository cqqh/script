#########################################################################
# File Name: 守护进程
# Author: cqqh
#########################################################################
#!/bin/bash

echo $$
while true
do

sn=`ps aux | grep analysis_log_ucloud.php | grep -v grep | awk '{print $2}'`
echo $sn
if [ "${sn}" = "" ]    #如果为空,表示进程未启动
then
nohup php /home/wwwroot/edm.msd/affair/analysis_log_ucloud.php >> /home/cqqh/msd_analysis_ucloud.log & #后台启动进程
echo start ok !
else
echo running
fi

#fajianbao_mail
sn=`ps aux | grep 'auto_ucloud.php mail' | grep -v grep | awk '{print $2}'`
echo $sn
if [ "${sn}" = "" ]    #如果为空,表示进程未启动
then
nohup php /home/wwwroot/fajianbao.msd/affair/auto_ucloud.php mail >> /home/cqqh/ucloud_mail.log & #后台启动进程
echo start ok !
else
echo auto_ucloud.php mail running
fi

#fajianbao_mx1
sn=`ps aux | grep 'auto_ucloud.php mx1' | grep -v grep | awk '{print $2}'`
echo $sn
if [ "${sn}" = "" ]    #如果为空,表示进程未启动
then
nohup php /home/wwwroot/fajianbao.msd/affair/auto_ucloud.php mx1 >> /home/cqqh/ucloud_mx1.log & #后台启动进程
echo start ok !
else
echo auto_ucloud.php mx1 running
fi

#fajianbao_mx3
sn=`ps aux | grep 'auto_ucloud_sh2.php mx3' | grep -v grep | awk '{print $2}'`
echo $sn
if [ "${sn}" = "" ]    #如果为空,表示进程未启动
then
nohup php /home/wwwroot/fajianbao.msd/affair/auto_ucloud_sh2.php mx3 >> /home/cqqh/ucloud_mx3.log & #后台启动进程
echo start ok !
else
echo auto_ucloud_sh2.php mx3 running
fi

#ty_mail
sn=`ps aux | grep 'auto_ucloud_zj.php ty_mail' | grep -v grep | awk '{print $2}'`
echo $sn
if [ "${sn}" = "" ]    #如果为空,表示进程未启动
then
nohup php /home/wwwroot/typost.msd/affair/auto_ucloud_zj.php ty_mail >> /home/cqqh/ucloud_tymail.log & #后台启动进程
echo start ok !
else
echo auto_ucloud_zj.php ty_mail running
fi

#ty_mx1
sn=`ps aux | grep 'auto_ucloud_zj.php ty_mx1' | grep -v grep | awk '{print $2}'`
echo $sn
if [ "${sn}" = "" ]    #如果为空,表示进程未启动
then
nohup php /home/wwwroot/typost.msd/affair/auto_ucloud_zj.php ty_mx1 >> /home/cqqh/ucloud_tymail.log & #后台启动进程
echo start ok !
else
echo auto_ucloud_zj.php ty_mx1 running
fi

#yjt_mail
sn=`ps aux | grep 'auto_ucloud_bj1.php yjt_mail' | grep -v grep | awk '{print $2}'`
echo $sn
if [ "${sn}" = "" ]    #如果为空,表示进程未启动
then
nohup php /home/wwwroot/youjiantong.msd/affair/auto_ucloud_bj1.php yjt_mail >> /home/cqqh/ucloud_yjt.log & #后台启动进程
echo start ok !
else
echo auto_ucloud_bj1.php yjt_mail running
fi

#yjt_mx1
sn=`ps aux | grep 'auto_ucloud_bj1.php yjt_mx1' | grep -v grep | awk '{print $2}'`
echo $sn
if [ "${sn}" = "" ]    #如果为空,表示进程未启动
then
nohup php /home/wwwroot/youjiantong.msd/affair/auto_ucloud_bj1.php yjt_mx1 >> /home/cqqh/ucloud_yjt.log & #后台启动进程
echo start ok !
else
echo auto_ucloud_bj1.php yjt_mx1 running
fi

sleep 60
done