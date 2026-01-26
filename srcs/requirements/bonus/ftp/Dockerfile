FROM debian:bookworm

RUN apt update && apt install -y vsftpd \
    && mkdir -p /var/run/vsftpd /var/www/html

COPY tools/vsftpd.conf /etc/vsftpd.conf
COPY tools/ftp_init.sh /ftp_init.sh

RUN chmod +x /ftp_init.sh

EXPOSE 21

CMD ["/ftp_init.sh"]