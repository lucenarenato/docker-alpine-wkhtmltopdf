FROM alpine:3.10
MAINTAINER Fabian Beuke <mail@beuke.org>

RUN apk add --update --no-cache \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family

# binary is static compiled against libssl1.0 libcrypto1.0 see issue #3
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.8/main' >> \
    /etc/apk/repositories && \
    apk --update --no-cache add libssl1.0 libcrypto1.0

# on alpine static compiled patched qt headless wkhtmltopdf (47.2 MB)
# compilation takes 4 hours on EC2 m1.large in 2016 thats why binary
COPY wkhtmltopdf /bin

ENTRYPOINT ["wkhtmltopdf"]
