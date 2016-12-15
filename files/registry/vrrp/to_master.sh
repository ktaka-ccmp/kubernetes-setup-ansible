#!/bin/bash

VIP={{ vip }}
EIP={{ eip }}

host=$(curl -s -H "Metadata-Flavor: Google"  http://metadata.google.internal/computeMetadata/v1/instance/hostname | cut -f 1 -d ".")
zone=$(curl -s -H "Metadata-Flavor: Google"  http://metadata.google.internal/computeMetadata/v1/instance/zone| cut -f 4 -d "/")

gcloud compute instances delete-access-config $host --zone $zone
gcloud compute instances add-access-config $host --zone $zone  --address  $EIP

