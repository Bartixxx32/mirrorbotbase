FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y python3 python3-pip rar unzip git aria2 g++ gcc autoconf automake \
    m4 libtool qt4-qmake make libqt4-dev libcurl4-openssl-dev \
    libcrypto++-dev libsqlite3-dev libc-ares-dev \
    libsodium-dev libnautilus-extension-dev \
    libssl-dev libfreeimage-dev swig curl pv jq ffmpeg locales python3-lxml
    
# Installing mega sdk python binding
ENV MEGA_SDK_VERSION '3.6.4'
RUN git clone https://github.com/meganz/sdk.git sdk
WORKDIR sdk
RUN git checkout v$MEGA_SDK_VERSION && ./autogen.sh && \
    ./configure --disable-silent-rules --enable-python --disable-examples && \
    make -j$(nproc --all) && cd bindings/python/ && \
    python3 setup.py bdist_wheel && cd dist/ && \
    pip3 install --no-cache-dir megasdk-$MEGA_SDK_VERSION-*.whl

