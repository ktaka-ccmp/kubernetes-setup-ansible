#!/bin/bash

[[ -f /var/run/netns/pod ]] || ln -s /proc/1/ns/net /var/run/netns/pod

ip netns exec pod ip add add {{ vip }}/32 dev eth0
arping -c 5 -i eth0 -PU {{ vip }}

