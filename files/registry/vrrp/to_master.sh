#!/bin/bash

VIP={{ vip }}
EIP={{ eip }}
EIP_ID={{ eip_id }}

export PATH=$PATH:/google-cloud-sdk/bin
export https_proxy=http://{{ inventory_hostname }}:8888

#### remove eip from other vm
uri=$(gcloud compute addresses list --uri|grep $EIP_ID)
token=$(curl -s  "http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token" -H "Metadata-Flavor: Google"|jq -r .access_token)
users=$(curl -s $uri -H "Authorization":"Bearer $token" |jq -r .users[]?)

if [ ! "$users" == "" ] ; then
        user=$(echo $users|sed -e "s/.*instances\///g")
        zone=$(echo $users|sed -e "s/.*zones\/\(.*\)\/.*\/.*/\1/g")
        config=$(curl -s $users -H "Authorization":"Bearer $token" |jq -r .networkInterfaces[].accessConfigs[].name?)

        gcloud compute instances delete-access-config $user --zone $zone --access-config-name "$config" &
fi

#### assign eip to myself

host=$(curl -s -H "Metadata-Flavor: Google"  http://metadata.google.internal/computeMetadata/v1/instance/hostname | cut -f 1 -d ".")
zone=$(curl -s -H "Metadata-Flavor: Google"  http://metadata.google.internal/computeMetadata/v1/instance/zone| cut -f 4 -d "/")
uri=$(gcloud compute instances list --uri|grep $host)
config=$(curl -s $uri -H "Authorization":"Bearer $token" |jq -r .networkInterfaces[]?.accessConfigs[]?.name?)

if [  "$config" != "" -a "$host" != "$user" ] ; then
        gcloud compute instances delete-access-config $host --zone $zone --access-config-name "$config" &
fi

wait
gcloud compute instances add-access-config $host --zone $zone  --address  $EIP

