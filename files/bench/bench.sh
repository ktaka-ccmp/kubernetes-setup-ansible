#!/bin/bash

wait=20

con=800
thr=40
dur=300s

bench(){
	echo wrk -c$con -t$thr -d$dur $url 
	echo $repl >> $file
	echo wrk -c$con -t$thr -d$dur $url >> $file
	echo -n "Start time: " >> $file
	date +%s >> $file
#	wrk -c$con -t$thr -d$dur $url >> $file
	echo -n "End time: " >> $file
	date +%s >> $file
	echo >> $file
}

set_sg(){
url=http://172.16.32.2/coffee
file=single.log
}

set_px(){
	echo >> $file
}

set_sg(){
url=http://172.16.32.2/coffee
file=single.log
}

set_px(){
url=http://10.254.51.177/coffee
file=proxy.log
}

set_ig(){
url=http://172.16.24.2/coffee
file=ingress.log
}

set_lv(){
url=http://10.0.255.10:8888/coffee
file=lvs.log
}

set_sg ; bench 

for repl in {1..10} ; do 

kubectl scale rc/coffee-rc --replicas=$repl -s 10.0.0.100:8080
sleep $wait
kubectl get pod -o wide -s 10.0.0.100:8080

echo start measurement for $repl
set_px ; bench 
set_ig ; bench 
set_lv ; bench 
echo end measurement for $repl
echo 

done


