FROM debian:latest

WORKDIR /app

COPY . .

RUN apt update &&\
    apt install nginx &&\
    wget https://github.com/pchpub/BiliRoaming-Rust-Server/releases/download/v0.3.2/biliroaming_rust_server &&\
    mv biliroaming_rust_server /usr/bin/local &&\
    mv config.json /usr/bin/local

ENTRYPOINT ["./entrypoint.sh"]
