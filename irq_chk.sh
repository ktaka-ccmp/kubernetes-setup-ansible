#!/bin/bash

IRQS=$(cat /proc/interrupts |egrep "eth0-TxRx"|cut -f 1 -d :|tr -d '\n')

for irq in $IRQS ; do
        file=/proc/irq/$irq/smp_affinity
        echo -n $file ": "
        cat $file
done

for file in /sys/class/net/eth0/queues/rx-*/rps_cpus ; do
        echo -n $file ": "
        cat $file| sed -e 's/00000000,//g'
done

file=/proc/sys/net/core/rps_sock_flow_entries
        echo -n $file ": "
        cat $file

for file in /sys/class/net/eth0/queues/rx-*/rps_flow_cnt ; do
        echo -n $file ": "
        cat $file
done

