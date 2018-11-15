#!/bin/sh


pid="$(ps aux | grep -i "[s]udo ./thttpd" | awk '{print $2}')"

echo $pid
sudo kill $pid

ps aux | grep thttpd

lsof -i tcp:3000
