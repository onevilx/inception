FROM debian:12

RUN apt update && apt install -y \
    php \
    php-mysql \
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN wget https://www.adminer.org/latest.php -O adminer.php

COPY tools/adminer_init.sh /adminer_init.sh
RUN chmod +x /adminer_init.sh

EXPOSE 5050

CMD ["/adminer_init.sh"]
