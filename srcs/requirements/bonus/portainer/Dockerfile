FROM debian:12

RUN apt update && apt install curl -y

WORKDIR /etc

RUN curl -L https://github.com/portainer/portainer/releases/download/2.31.3/portainer-2.31.3-linux-amd64.tar.gz -o portainer.tar.gz && tar xzf portainer.tar.gz && rm portainer.tar.gz

CMD bash -c './portainer/portainer --admin-password "$PORTAINER_ADMIN_PASS"'