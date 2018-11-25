FROM nginx
MAINTAINER test kube admin

RUN apt-get update && apt-get install kmod iproute2 iptables -y

COPY nginx.conf /etc/nginx/nginx.conf
COPY server.sh /

ENTRYPOINT ["/server.sh"]

