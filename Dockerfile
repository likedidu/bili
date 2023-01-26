FROM messense/rust-musl-cross:x86_64-musl as builder

WORKDIR /root

RUN git clone https://github.com/pchpub/BiliRoaming-Rust-Server.git &&\
    cargo build

FROM alpine:latest

WORKDIR /app

COPY --from=builder /root/biliroaming_rust_server/target/release/biliroaming_rust_server /usr/local/bin
COPY config.json /usr/local/bin
COPY . .

RUN apk update &&\
    apk add caddy 

ENTRYPOINT ["./entrypoint.sh"]
