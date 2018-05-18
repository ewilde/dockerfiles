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
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /root/

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "curl", "--help" ]
