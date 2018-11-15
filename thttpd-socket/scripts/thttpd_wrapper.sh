#!/bin/sh

while true ; do
    /usr/local/sbin/thttpd -D -C /usr/local/www/thttpd_config
    sleep 10
done
