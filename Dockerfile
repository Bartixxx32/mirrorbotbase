FROM python:3-slim-buster

RUN apt-get update

RUN apt-get -y install -y git g++ gcc autoconf automake \
    m4 libtool qt4-qmake make libqt4-dev libcurl4-openssl-dev \
    libcrypto++-dev libsqlite3-dev libc-ares-dev \
    libsodium-dev libnautilus-extension-dev \
    libssl-dev libfreeimage-dev swig
    
RUN apt-get -y install -y p7zip-full aria2 curl pv jq ffmpeg locales python3-lxml

# Installing mega sdk python binding
ENV MEGA_SDK_VERSION '3.7.2'
RUN git clone --depth 1 https://github.com/meganz/sdk.git -b release/v3.7.2 sdk && cd sdk &&\
    ./autogen.sh && \
    ./configure --disable-silent-rules --enable-python --disable-examples && \
    make -j$(nproc --all) && cd bindings/python/ && \
    python3 setup.py bdist_wheel && cd dist/ && \
    pip3 install --no-cache-dir megasdk-$MEGA_SDK_VERSION-*.whl