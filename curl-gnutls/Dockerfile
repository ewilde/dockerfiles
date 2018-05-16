FROM alpine:3.7

RUN apk update \
 && apk add curl gnupg g++ m4 make pkgconfig p11-kit libtasn1 libffi-dev gmp-dev unbound-dev

COPY nettle.gpg .
COPY gnutls.gpg .
RUN gpg --import nettle.gpg
RUN gpg --import gnutls.gpg

# https://gmplib.org/
RUN curl https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz -o gmp-6.1.2.tar.xz
RUN curl https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz.sig -o gmp-6.1.2.tar.xz.sig
RUN gpg --verify gmp-6.1.2.tar.xz.sig gmp-6.1.2.tar.xz

RUN tar -xvf gmp-6.1.2.tar.xz \
    && cd gmp-6.1.2 \
    && ./configure \
    && make install

# https://www.lysator.liu.se/~nisse/nettle/
RUN curl https://ftp.gnu.org/gnu/nettle/nettle-3.4.tar.gz -o nettle-3.4.tar.gz
RUN curl https://ftp.gnu.org/gnu/nettle/nettle-3.4.tar.gz.sig -o nettle-3.4.tar.gz.sig
RUN gpg --verify nettle-3.4.tar.gz.sig nettle-3.4.tar.gz

RUN tar -xvf nettle-3.4.tar.gz \
    && cd nettle-3.4 \
    && ./configure --with-gmp \
    && make install

# libtasn1
COPY libtasn1.gpg .
RUN gpg --import libtasn1.gpg
RUN curl  https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.13.tar.gz -o libtasn1-4.13.tar.gz \
    && curl  https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.13.tar.gz.sig -o libtasn1-4.13.tar.gz.sig \
    && gpg --verify libtasn1-4.13.tar.gz.sig libtasn1-4.13.tar.gz \
    && tar -xvf libtasn1-4.13.tar.gz \
    && cd libtasn1-4.13 \
    && ./configure \
    && make \
    && make install

# p11-kit
RUN wget https://github.com/p11-glue/p11-kit/releases/download/0.23.10/p11-kit-0.23.10.tar.gz -O p11-kit-0.23.10.tar.gz \
    && wget https://github.com/p11-glue/p11-kit/releases/download/0.23.10/p11-kit-0.23.10.tar.gz.sig -O p11-kit-0.23.10.tar.gz.sig \
    && tar -xvf p11-kit-0.23.10.tar.gz \
    && cd p11-kit-0.23.10 \
    && ./configure \
    && make \
    && make install

RUN curl https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.1.tar.xz -o gnutls-3.6.1.tar.xz
RUN curl https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.1.tar.xz.sig -o gnutls-3.6.1.tar.xz.sig
RUN gpg --verify gnutls-3.6.1.tar.xz.sig gnutls-3.6.1.tar.xz

RUN tar -xvf gnutls-3.6.1.tar.xz \
    && cd gnutls-3.6.1 \
    && ./configure --with-included-unistring \
    && make install

COPY curl.gpg .
RUN gpg --import curl.gpg
RUN curl https://curl.haxx.se/download/curl-7.60.0.tar.gz -o curl-7.60.0.tar.gz
RUN curl https://curl.haxx.se/download/curl-7.60.0.tar.gz.asc -o curl-7.60.0.tar.gz.asc
RUN gpg --verify curl-7.60.0.tar.gz.asc curl-7.60.0.tar.gz

RUN tar -xvf curl-7.60.0.tar.gz \
    && cd curl-7.60.0 \
    && ./configure --with-gnutls --without-ssl \
    && make install

ENTRYPOINT ["curl"]
CMD ["--help"]
