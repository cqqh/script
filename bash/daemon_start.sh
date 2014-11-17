#!/bin/bash

if [ "$1"x = "stop"x ]
then
    echo "stop"
    killall php
else
    echo "start"
    killall php
    cd /home/cqqh/weixin
    nohup php weixin_daemon.php &
fi
