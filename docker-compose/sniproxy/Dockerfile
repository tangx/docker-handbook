FROM alpine:3.10

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --update --no-cache \
    sniproxy
COPY ./sniproxy.conf /etc/sniproxy/sniproxy.conf

CMD ["sniproxy", "-f" , "-c", "/etc/sniproxy/sniproxy.conf"]

