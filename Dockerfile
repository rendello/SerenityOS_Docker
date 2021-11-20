FROM debian:latest AS setup_debian
WORKDIR .
RUN echo "deb http://http.us.debian.org/debian/ testing non-free contrib main" >> /etc/apt/sources.list
RUN apt update -y
RUN apt install -y unzip rsync gcc-10 g++-10
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 900 --slave /usr/bin/g++ g++ /usr/bin/g++-10
RUN apt install -y genext2fs git vim 
RUN apt install -y build-essential cmake curl libmpfr-dev \
    libmpc-dev libgmp-dev e2fsprogs ninja-build qemu-system-i386 qemu-utils

FROM setup_debian AS build_serenity
RUN git clone https://github.com/SerenityOS/serenity.git /serenity
WORKDIR /serenity/Meta
RUN ./serenity.sh rebuild-toolchain
RUN ./serenity.sh image
