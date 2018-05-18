FROM ewilde/curl-gnutls-ubuntu:latest
LABEL maintainer "Edward Wilde <ewilde@gmail.com>"

RUN apt-get update && apt-get install -y \
	software-properties-common \
	--no-install-recommends && \
	add-apt-repository ppa:yubico/stable && \
	apt-get update && apt-get install -y \
	pcscd \
	usbutils \
	yubico-piv-tool \
	opensc \
	autoconf \
	libengine-pkcs11-openssl \
	libglib2.0-dev \
	build-essential \
	libpcsclite-dev \
	libp11-kit-dev \
	libp11-kit-gnome-keyring \
	libssl-dev \
	libreadline-dev
RUN rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/OpenSC/OpenSC/releases/download/0.18.0/opensc-0.18.0.tar.gz -O opensc-0.18.0.tar.gz \
    && tar -xvf ./opensc-0.18.0.tar.gz \
    && cd opensc-0.18.0 \
    && ./configure --disable-strict \
    && make \
    && make install
RUN ldconfig

COPY config/pkcs11.conf /etc/pkcs11/pkcs11.conf
COPY config/opensc-pkcs11.module /root/.config/pkcs11/modules/opensc-pkcs11.module
COPY config/opensc-pkcs11.module /usr/share/p11-kit/modules/opensc-pkcs11.module

RUN touch touch /root/.config/pkcs11/pkcs11.conf

WORKDIR /root/

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "curl", "--help" ]
