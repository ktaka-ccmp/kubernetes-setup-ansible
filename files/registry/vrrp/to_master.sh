#!/bin/bash

# VIP kirikae shimasu
# VIP kaburanai youni chu-i

ALOCID=eipalloc-f919809e
VIP=10.0.128.251
REGION=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone |sed -e 's/[a-c]$//')

mac=$(curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/)
ENI=$(curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$mac/interface-id)

aws ec2 assign-private-ip-addresses --network-interface-id $ENI --private-ip-addresses $VIP --allow-reassignment --region $REGION
aws ec2 associate-address --network-interface-id $ENI --allocation-id $ALOCID --private-ip-address  $VIP --allow-reassociation  --region $REGION


