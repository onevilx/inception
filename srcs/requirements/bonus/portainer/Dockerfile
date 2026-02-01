FROM debian:12

RUN apt update && apt install curl -y

WORKDIR /portainer

RUN curl -L https://github.com/portainer/portainer/releases/download/2.33.1/portainer-2.33.1-linux-amd64.tar.gz -o portainer.tar.gz && tar xzf portainer.tar.gz && rm portainer.tar.gz

CMD ["./portainer/portainer"]
