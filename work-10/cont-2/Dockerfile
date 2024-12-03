FROM rust:1.72

WORKDIR /usr/src/myapp

COPY Cargo.toml Cargo.lock ./

RUN cargo fetch

COPY . .

RUN cargo build --release

CMD ["./target/release/cont-2"]
