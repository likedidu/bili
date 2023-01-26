FROM debian:latest

WORKDIR /app

COPY . .

RUN apt update &&\
    apt install -y nginx wget &&\
    wget https://github.com/pchpub/BiliRoaming-Rust-Server/releases/download/v0.3.2/biliroaming_rust_server &&\
    chmod +x biliroaming_rust_server &&\
    chmod +x entrypoint.sh &&\
    mv biliroaming_rust_server /usr/bin/local &&\
    mv config.json /usr/bin/local

ENTRYPOINT ["./app/entrypoint.sh"]
