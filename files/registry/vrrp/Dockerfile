FROM  debian:jessie
RUN apt-get update \
    && apt-get install -y keepalived tcpdump arping python-pip python-dev curl wget jq\
    && apt-get clean
RUN pip install awscli
RUN wget -O - https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-121.0.0-linux-x86_64.tar.gz |tar zxf -
RUN cd google-cloud-sdk && ./install.sh --quiet
RUN cd / && /google-cloud-sdk/bin/gcloud components update --quiet
RUN mkdir -p /etc/keepalived/vrrp/
COPY vrrp.conf /etc/keepalived/vrrp/
COPY to_master.sh /etc/keepalived/vrrp/
COPY to_backup.sh /etc/keepalived/vrrp/

CMD /sbin/ip netns exec node /usr/sbin/keepalived -nlDP -f /etc/keepalived/vrrp/vrrp.conf

