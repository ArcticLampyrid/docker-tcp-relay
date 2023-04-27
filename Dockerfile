FROM rust:latest AS builder
RUN rustup target add x86_64-unknown-linux-musl
RUN apt update && apt install -y musl-tools musl-dev git
RUN update-ca-certificates
WORKDIR /tcp-relay-rust
RUN git clone https://github.com/cedric05/tcp-relay-rust . --no-checkout && git checkout 6de9bd191fa97aa73e8696ebefd5a50286eb2b25
RUN cargo build --target x86_64-unknown-linux-musl --release

FROM alpine
WORKDIR /tcp-relay-rust
COPY --from=builder /tcp-relay-rust/target/x86_64-unknown-linux-musl/release/tcp-relay-rust ./
ENTRYPOINT ["/tcp-relay-rust/tcp-relay-rust"]