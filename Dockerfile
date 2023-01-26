FROM alpine:latest

WORKDIR /app

COPY . .

RUN apk update &&\
    apk install caddy &&\
    wget https://github.com/pchpub/BiliRoaming-Rust-Server/releases/download/v0.3.2/biliroaming_rust_server 

ENTRYPOINT ["./entrypoint.sh"]
