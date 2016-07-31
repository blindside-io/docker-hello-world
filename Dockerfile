FROM alpine:latest

LABEL io.blindside.example="yes-indeed"

RUN mkdir /blindside
ADD entrypoint.sh /blindside/entrypoint.sh
ADD banner.txt /blindside/banner.txt
ENTRYPOINT ["/blindside/entrypoint.sh"]
CMD ["/bin/sh", "-i"]
