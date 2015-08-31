#!/usr/bin/env bash

PIDFILE=/tmp/check_git.lock       #
if [ x"$1" = x-daemon ]; then
  if test -f "$PIDFILE"; then exit; fi
  echo $$ > "$PIDFILE"
  trap "rm '$PIDFILE'" EXIT SIGTERM
  while true; do
    cd /web/GTmall.dev           #git项目地址
    git pull origin "develop"
    wait
    sleep 5
  done
elif [ x"$1" = x-stop ]; then
  kill -9 `cat "$PIDFILE"`
  rm "$PIDFILE"
else
  nohup "$0" -daemon &
fi
