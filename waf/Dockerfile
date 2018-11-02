FROM nginx:1.15.5
MAINTAINER Jakub Kuchar

ADD build.sh /build.sh
RUN chmod +x /build.sh
RUN /bin/bash -c "source /build.sh"

ADD nginx.conf /etc/nginx/nginx.conf

ADD modsecurity.conf /etc/nginx/conf/modsecurity.conf
ADD modsec_includes.conf /etc/nginx/conf/modsec_includes.conf
ADD crs-setup.conf /etc/nginx/conf/rules/crs-setup.conf

CMD nginx -g 'daemon off;'