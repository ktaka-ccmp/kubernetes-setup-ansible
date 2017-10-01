#!/bin/bash 

sudo aptitude install python-pip python-dev python-setuptools -y
sudo aptitude install gcc libffi-dev libssl-dev git -y

sudo pip install markupsafe ansible
sudo pip install cryptography

HOSTS_FILE=./hosts
HOSTS=$(sed "/^\[.*\]$/d" $HOSTS_FILE|sort -u )

for hst in $HOSTS ; do
	ssh-keygen -R $hst
	ssh-keygen -R $(getent ahostsv4 $hst|cut -f 1 -d " "|uniq)
	ssh-keyscan $hst >> ~/.ssh/known_hosts
done

for hst in $HOSTS ; do
	ssh $hst "hostname; uptime" || exit
done

#ansible-playbook -i ./hosts ./master.yml -vv
#ansible-playbook -i ./hosts ./node.yml -vv
#ansible-playbook -i ./hosts ./lvs.yml -vv

