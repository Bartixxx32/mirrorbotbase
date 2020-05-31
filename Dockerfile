FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y python3 python3-pip rar unzip git aria2 g++ gcc autoconf automake \
    m4 libtool qt4-qmake make libqt4-dev libcurl4-openssl-dev \
    libcrypto++-dev libsqlite3-dev libc-ares-dev \
    libsodium-dev libnautilus-extension-dev \
    libssl-dev libfreeimage-dev swig curl pv jq ffmpeg locales python3-lxml
