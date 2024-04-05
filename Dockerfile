FROM debian:stable as build

RUN apt-get update

RUN apt-get install -y git gcc meson ninja-build wget

WORKDIR /usr/local/bin/

RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.82.0/source/boost_1_82_0.tar.gz

RUN tar -xvzf boost_1_82_0.tar.gz 

ARG BOOST_ROOT=/usr/local/bin/boost_1_82_0/

WORKDIR /usr/local/bin/coati

RUN git clone https://github.com/CartwrightLab/coati.git .

RUN meson setup builddir --buildtype=release

RUN meson compile -C builddir

ARG DESTDIR=/usr/local/bin/coati_build/

RUN meson install -C builddir

FROM debian:stable as dist

COPY --from=build /usr/local/bin/coati_build/usr/local/bin/coati /usr/local/bin/coati

ENV PATH="${PATH}:/usr/local/bin/"

