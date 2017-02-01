FROM  debian:jessie
RUN apt-get update \
    && apt-get install -y keepalived tcpdump arping \
    && apt-get clean
RUN mkdir -p /etc/keepalived/vrrp/
COPY vrrp.conf /etc/keepalived/vrrp/

CMD /usr/sbin/keepalived -nlDP -f /etc/keepalived/vrrp/vrrp.conf 



