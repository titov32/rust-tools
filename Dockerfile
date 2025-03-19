#FROM rust:1.85.0-slim-bullseye
FROM rust:latest

RUN apt update
RUN apt install -y \
   musl-tools \
   musl-dev \
   pkg-config \
   g++ \
   gcc \
   libc++-dev \
   libxcb1-dev \
   libxcb-render0-dev \
   libxcb-shape0-dev \
   libxcb-xfixes0-dev \
   python3 \
   libxcb1-dev \
   libxcb-render0-dev \
   libxcb-shape0-dev \
   libxcb-xfixes0-dev \
   libxau-dev \
   libxdmcp-dev

# Создаем симлинк для musl-g++
RUN ln -s /usr/bin/musl-gcc /usr/bin/musl-g++

# Добавляем поддержку musl для Rust
RUN rustup target add x86_64-unknown-linux-musl

# https://github.com/atuinsh/atuin
RUN cargo install --target x86_64-unknown-linux-musl atuin -j 8

#RUN cargo install cross -j 8

# https://github.com/imsnif/bandwhich
RUN cargo install --target x86_64-unknown-linux-musl bandwhich -j 8
# https://github.com/Canop/broot
RUN cargo install --target x86_64-unknown-linux-musl broot -j 8
RUN cargo install --target x86_64-unknown-linux-musl bat -j 8
# https://github.com/ClementTsang/bottom
RUN cargo install --target x86_64-unknown-linux-musl bottom -j 8

RUN cargo install --target x86_64-unknown-linux-musl du-dust -j 8
# https://crates.io/crates/git-delta
RUN cargo install --target x86_64-unknown-linux-musl git-delta -j 8
RUN cargo install --git https://github.com/titov32/dog.git dog -j 8 --target x86_64-unknown-linux-musl

RUN cargo install --target x86_64-unknown-linux-musl eza -j 8

# https://github.com/pkolaczk/fclones
RUN cargo install --target x86_64-unknown-linux-musl fclones -j 8
RUN cargo install --target x86_64-unknown-linux-musl fd-find -j 8
RUN cargo install --target x86_64-unknown-linux-musl fselect -j 8

#RUN export RUSTFLAGS='-C target-feature=-crt-static' && cargo install --target x86_64-unknown-linux-musl jless -j 8

RUN cargo install --git https://github.com/titov32/jless.git jless -j 8 --target x86_64-unknown-linux-musl

RUN cargo install --target x86_64-unknown-linux-musl lfs -j 8
RUN cargo install --target x86_64-unknown-linux-musl lsd -j 8

# https://github.com/macchina-cli/macchina -j 8
RUN cargo install --target x86_64-unknown-linux-musl macchina -j 8

RUN cargo install --target x86_64-unknown-linux-musl procs -j 8
# https://github.com/Elkowar/pipr
RUN cargo install --target x86_64-unknown-linux-musl pipr -j 8

RUN cargo install --target x86_64-unknown-linux-musl ripgrep -j 8


RUN cargo install --target x86_64-unknown-linux-musl tealdeer -j 8
RUN cargo install --target x86_64-unknown-linux-musl tokei -j 8
RUN cargo install --target x86_64-unknown-linux-musl zoxide -j 8

RUN cargo install --target x86_64-unknown-linux-musl xh -j 8

# Trouble packages:
# https://github.com/sectordistrict/intentrace
#RUN cargo install --target x86_64-unknown-linux-musl intentrace -j 8
#RUN cargo install --target x86_64-unknown-linux-musl topgrade -#j 8
#RUN cargo install --target x86_64-unknown-linux-musl mdcat -j 8
#RUN cargo install --target x86_64-unknown-linux-musl difftastic -j 8
