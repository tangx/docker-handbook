# FROM nginx:1.17.3-alpine AS builder
FROM nginx:1.17.3-alpine AS builder

# nginx:alpine contains NGINX_VERSION environment variable, like so:
ENV NGINX_VERSION 1.17.3

# For latest build deps, see https://github.com/nginxinc/docker-nginx/blob/master/mainline/alpine/Dockerfile
RUN apk add --no-cache --virtual .build-deps \
  gcc \
  libc-dev \
  make \
  openssl-dev \
  pcre-dev \
  zlib-dev \
  linux-headers \
  curl \
  gnupg \
  libxslt-dev \
  gd-dev \
  geoip-dev \
  git

RUN mkdir -p /data/  \
    && cd /data/ \
    && git clone https://github.com/chobits/ngx_http_proxy_connect_module.git  \
    && wget "http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz"   \
    && tar xf nginx-${NGINX_VERSION}.tar.gz \
    && cd nginx-${NGINX_VERSION}    \
    && patch -p1 < /data/ngx_http_proxy_connect_module/patch/proxy_connect_rewrite_101504.patch     \
    && CONFARGS=$(nginx -V 2>&1 | sed -n -e 's/^.*arguments: //p')      \
    && ./configure  --with-compat --add-dynamic-module=/data/ngx_http_proxy_connect_module/ --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib/nginx/modules --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --with-perl_modules_path=/usr/lib/perl5/vendor_perl --user=nginx --group=nginx --with-compat --with-file-aio --with-threads --with-http_addition_module --with-http_auth_request_module --with-http_dav_module --with-http_flv_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_mp4_module --with-http_random_index_module --with-http_realip_module --with-http_secure_link_module --with-http_slice_module --with-http_ssl_module --with-http_stub_status_module --with-http_sub_module --with-http_v2_module --with-mail --with-mail_ssl_module --with-stream --with-stream_realip_module --with-stream_ssl_module --with-stream_ssl_preread_module --with-cc-opt='-Os -fomit-frame-pointer' --with-ld-opt=-Wl,--as-needed  \
    && make && make install

FROM nginx:1.17.3-alpine
# COPY --from=builder /usr/local/nginx/modules/ngx_http_proxy_connect_module.so /usr/local/nginx/modules/ngx_http_proxy_connect_module.so

COPY --from=builder /usr/sbin/nginx /usr/sbin/nginx
COPY --from=builder /etc/nginx/modules/ngx_http_proxy_connect_module.so /etc/nginx/modules/ngx_http_proxy_connect_module.so


STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]
