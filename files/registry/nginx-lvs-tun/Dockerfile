FROM nginx
MAINTAINER test kube admin

RUN apt-get update && apt-get install kmod iproute2 -y

COPY server.sh /
ENTRYPOINT ["/server.sh"]

