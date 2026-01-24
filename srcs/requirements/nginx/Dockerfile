FROM debian:12

RUN apt update && apt install bash nginx openssl -y
RUN mkdir -p /etc/nginx/ssl

# Create self-signed certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/C=MA/ST=Béni Mellal-Khénifra/L=Khouribga/O=Inception/OU=ALL/CN=yaboukir.42.fr"

# Copy config
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]