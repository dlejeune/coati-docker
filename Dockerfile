FROM debian:stable as build

RUN apt-get update

RUN apt-get install -y git gcc meson ninja-build wget procps

WORKDIR /usr/local/bin/

RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.82.0/source/boost_1_82_0.tar.gz

RUN tar -xvzf boost_1_82_0.tar.gz 

ENV BOOST_ROOT=/usr/local/bin/boost_1_82_0/

WORKDIR /usr/local/bin/coati_src

RUN git clone https://github.com/CartwrightLab/coati.git .

RUN meson setup builddir --buildtype=release

RUN meson compile -C builddir

# ARG DESTDIR=/usr/local/bin/coati_build/

RUN meson install -C builddir

WORKDIR /usr/local/bin/

# FROM debian:stable as dist


# #This is just for nextflow
# # RUN apt-get update
# # RUN apt-get install -y procps

# COPY --from=build /usr/local/bin/coati_build/usr/local/bin/coati /usr/local/bin/coati
