# Alpine Wkhtmltopdf Docker Container


# docker-alpine-wkhtmltopdf
### Solved: Had to use a version of wkhtmltopdf that is patched for Alpine. github.com/madnight/docker-alpine-wkhtmltopdf
### Valeu funcionou! Obrigado. 
- "Uso docker e Laravel"
- https://github.com/madnight/docker-alpine-wkhtmltopdf/raw/master/wkhtmltopdf

## wkhtmltopdf
```
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
```

- https://gist.github.com/lucenarenato/27d601f2bc631a856988ed48821e7848

[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://opensource.org/licenses/MIT)
[![](https://travis-ci.org/madnight/docker-alpine-wkhtmltopdf.svg)](https://travis-ci.org/madnight/docker-alpine-wkhtmltopdf)
[![](https://images.microbadger.com/badges/image/madnight/docker-alpine-wkhtmltopdf.svg)](https://microbadger.com/images/madnight/docker-alpine-wkhtmltopdf "Get your own image badge on microbadger.com")

## Usage

wkhtmltopdf with qt patches

yes, Alpine does have a wkhtmltopdf package... but it doesn't include the qt patches ... enjoy!


```
# i do it myself
docker build -t alpine-wkhtmltopdf .
docker run alpine-wkhtmltopdf google.com - > test.pdf

# i'm lazy
docker run madnight/docker-alpine-wkhtmltopdf google.com - > test.pdf

# or mount a local file (e.g. test.html)
docker run --rm -v $(pwd):/data madnight/docker-alpine-wkhtmltopdf /data/test.html - > test.pdf
```

## Q&A
*Is it really the smallest html to pdf docker image on the planet?*

Yes.

- Renato Lucena

