FROM alpine:latest
MAINTAINER Blindside <learn@blindside.io>

LABEL io.blindside.example="yes-indeed"

RUN apk upgrade --update && \
    apk add g++ make git && \
    cd /tmp && git clone http://github.com/klange/nyancat.git && \
    cd /tmp/nyancat && make && cp ./src/nyancat /usr/local/bin/ && cd / && \
    rm -rf /tmp/nyancat && \
    apk del --purge g++ make git

RUN mkdir /blindside

ADD entrypoint.sh /blindside/entrypoint.sh
ADD banner.txt /blindside/banner.txt

ENTRYPOINT ["/blindside/entrypoint.sh"]
CMD ["/bin/sh", "-i"]
