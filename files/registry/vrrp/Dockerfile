FROM  debian:jessie
RUN apt-get update \
    && apt-get install -y keepalived tcpdump arping python-pip python-dev curl\
    && apt-get clean
RUN pip install awscli
RUN mkdir -p /etc/keepalived/vrrp/
COPY vrrp.conf /etc/keepalived/vrrp/
COPY to_master.sh /etc/keepalived/vrrp/

CMD /usr/sbin/keepalived -nlDP -f /etc/keepalived/vrrp/vrrp.conf 



