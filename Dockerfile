FROM alpine:edge as setup_prereqs

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update && apk add \
        bash \
        curl \
        git \
        util-linux \
        sudo \
        build-base \
        qemu \
        qemu-system-i386 \
        qemu-img \
        qemu-ui-gtk \
        cmake \
        e2fsprogs \
        grub-bios \
        samurai \
        mpc1-dev \
        mpfr-dev \
        gmp-dev \
        ccache \
        rsync \
        coreutils \
        genext2fs@testing

FROM setup_prereqs AS build_serenity
RUN git clone https://github.com/SerenityOS/serenity.git /serenity
WORKDIR /serenity/Meta/
RUN ./serenity.sh rebuild-toolchain
RUN ./serenity.sh image
