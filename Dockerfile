FROM alpine:latest
MAINTAINER thanos_me <thanosme@totallynoob.com>

RUN apk add --no-cache --update wget \
 && wget --no-check-certificate https://github.com/spf13/hugo/releases/download/v0.17/hugo_0.17_Linux-64bit.tar.gz \
 && tar zxvf hugo_0.17_Linux-64bit.tar.gz \
 && mv hugo_0.17_linux_amd64/hugo_0.17_linux_amd64 /usr/local/bin/hugo \
 && rm -r hugo_0.17_linux_amd64 \
 && chmod +x /usr/local/bin/hugo

RUN adduser hugo -H -D -s /bin/false

ADD https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64 /usr/local/bin/gosu
ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/gosu \
 && chmod +x /usr/local/bin/dumb-init

VOLUME /data
WORKDIR /data
EXPOSE 1313
ENTRYPOINT ["/usr/local/bin/dumb-init", "/usr/local/bin/gosu", "hugo", "/usr/local/bin/hugo"]
