FROM nginx
MAINTAINER test kube admin

ENV location /usr/share/nginx/html
ENV index $location/index.html 
ENV coffee $location/coffee
ENV tea $location/tea
COPY nginx.conf /etc/nginx/nginx.conf

CMD tail -n 1 /etc/hosts |awk '{print $1}'|tee $index $coffee $tea  > /dev/null \
        && /usr/sbin/nginx -g "daemon off;"



