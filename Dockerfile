FROM debian:stretch

# Installation de NGINX de dnsmasq
RUN apt-get update
RUN apt-get install nginx curl dnsmasq -y

# Creacion de carpeta para certificados
RUN mkdir /etc/nginx/certificates

# Volumes
VOLUME /etc/nginx/sites-enabled
VOLUME /etc/nginx/certificates

# Copiar los ficheros de configuracion
COPY confs/nginx.conf /etc/nginx/
COPY confs/proxy.conf /etc/nginx/conf.d/

# Exposicion de los puertos
EXPOSE 80 443

# Add command
CMD ["nginx", "-g", "daemon off;"]
HEALTHCHECK CMD curl --fail http://localhost || exit 1