FROM debian:stretch

MAINTAINER Usuario001 "patinogutierrez@icloud.com"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install net-tools nginx && \
    useradd -ms /bin/bash aurora && \
    rm -f /etc/nginx/fastcgi.conf /etc/nginx/fastcgi_params && \
    rm -f /etc/nginx/snippets/fastcgi-php.conf /etc/nginx/snippets/snakeoil.conf

EXPOSE 80
EXPOSE 443

COPY nginx/snippets /etc/nginx/snippets

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]