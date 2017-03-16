#!/bin/bash

[[ -f /var/run/netns/pod ]] || ln -s /proc/1/ns/net /var/run/netns/pod

ip netns exec pod ip add del {{ vip }}/32 dev eth0



