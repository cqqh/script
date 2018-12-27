#!/bin/bash
# 切割日志，只完成把上一个的日志输出成文件

month=`date -d '-1 month' +%b`
monthnum=`date -d '-1 month' +%Y%m`

cat /home/cqqh/edm_ucloud.log | grep "$month " > /home/cqqh/log/edm_ucloud_qq.$monthnum.log