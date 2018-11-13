#!/bin/bash

modprobe ipip
ip link set dev tunl0 up
ip route add local 10.1.1.0/24 dev tunl0

location=/usr/share/nginx/html
index=$location/index.html 
coffee=$location/coffee
tea=$location/tea

tail -n 1 /etc/hosts |awk '{print $1}'|tee $index $coffee $tea  

exec /usr/sbin/nginx -g "daemon off;"


