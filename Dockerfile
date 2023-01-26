FROM debian:latest

WORKDIR /app

COPY . .

RUN apt update &&\
    apt upgrade &&\
    apt install curl debian-keyring debian-archive-keyring apt-transport-https &&\
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list &&\
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | apt-key add - &&\
    apt update &&\
    apt install caddy &&\
    wget https://github.com/pchpub/BiliRoaming-Rust-Server/releases/download/v0.3.2/biliroaming_rust_server 

ENTRYPOINT ["./entrypoint.sh"]
