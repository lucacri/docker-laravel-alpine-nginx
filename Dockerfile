FROM lucacri/alpine-base:3.11.7

LABEL maintainer="lucacri@gmail.com"

ARG CACHEBUST=20200312-2

ARG UID=501
ARG GID=501

ARG INSTALL_PHANTOMJS=0
# php7-fileinfo \
RUN apk upgrade --update-cache && \
    apk add curl ca-certificates && \
    wget "https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub" -O /etc/apk/keys/php-alpine.rsa.pub && \
    echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "@edge http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@php7 https://dl.bintray.com/php-alpine/v3.11/php-7.4"  >> /etc/apk/repositories && \
    apk update && \
    apk add \
    php7@php7 \
    php7-phar@php7 \
    php7-json@php7 \
    php7-openssl@php7 \
    php7-dom@php7 \
    php7-mysqlnd@php7 \
    php7-mysqli@php7 \
    php7-posix@php7 \
    php7-pcntl@php7 \
    php7-pdo@php7 \
    php7-pdo_pgsql@php7 \
    php7-pdo_sqlite@php7 \
    php7-pdo_mysql@php7 \
    php7-common@php7 \
    php7-fpm@php7 \
    php7-bcmath@php7 \
    php7-zip@php7 \
    php7-bz2@php7 \
    php7-curl@php7 \
    php7-gd@php7 \
    php7-intl@php7 \
    php7-sqlite3@php7 \
    php7-ctype@php7 \
    php7-tidy@php7 \
    php7-pgsql@php7 \
    php7-xml@php7 \
    php7-mbstring@php7 \
    php7-session@php7 \
    php7-zlib@php7 \
    php7-opcache@php7 \
    php7-soap@php7 \
    php7-xdebug@php7 \
    php7-imagick@php7 \
    php7-exif@php7 \
    php7-xmlreader@php7 \
    php7-iconv@php7 \
    php7-redis@php7 \
    php7-gettext@php7 \
    ghostscript \
    ghostscript-dev \
    procps \
    nano \
    nodejs \
    npm \
    bzip2 \
    git \
    curl \
    fontconfig \
    openssh \
    bash \
    libpng-dev \
    ffmpeg \
    yarn \
    imagemagick \
    ghostscript-fonts \
    jpegoptim \
    optipng \
    pngquant \
    gifsicle \
    rsync \
    nginx \
    shadow \
    composer@community && \
    ln -sf /usr/bin/php7 /usr/bin/php && \
    mkdir -p /usr/share && \
    cd /usr/share && \
    if [ "$INSTALL_PHANTOMJS" = "0" ] ; then \
    echo "Skipping install of PhantomJs" ; else \ 
    curl -L https://github.com/Overbryd/docker-phantomjs-alpine/releases/download/2.11/phantomjs-alpine-x86_64.tar.bz2 | tar xj && \
    ln -s /usr/share/phantomjs/phantomjs /usr/bin/phantomjs && \
    ln -s /usr/share/phantomjs/phantomjs /usr/local/bin/phantomjs && \
    phantomjs --version ; fi && \
    cd /tmp && \
    composer selfupdate && \
    mkdir /var/www-upload && \
    chmod 777 /var/www-upload && \
    mkdir -p /tmp/tmp && \
    touch /tmp/tmp.tmp && \
    rm -rf /var/cache/apk/* && \
    usermod -u ${UID} nginx && \
    groupmod -g ${GID} nginx && \
    rm /etc/nginx/conf.d/* && \
    mkdir -p /var/tmp/nginx && chown -Rf nginx:nginx /var/tmp/nginx || true && \
    mkdir -p  /var/lib/nginx && chown -Rf nginx:nginx /var/lib/nginx  || true && \
    composer global require hirak/prestissimo && \
    composer global clear-cache && \
    wget https://github.com/just-containers/socklog-overlay/releases/download/v3.1.0-2/socklog-overlay-amd64.tar.gz -O /tmp/socklog-overlay-amd64.tar.gz && \
    tar xzf  /tmp/socklog-overlay-amd64.tar.gz -C / && \
    rm /tmp/socklog-overlay-amd64.tar.gz



ENV ENABLE_CRON=1 \
    ENABLE_HORIZON=0 \
    ENABLE_WEB=1 \
    ENABLE_LOGS=1 \
    ENABLE_OPCACHE=1 \
    ENABLE_XDEBUG=0 \
    ENABLE_WEBSOCKETS=0 \
    STARTUP_MIGRATE=1 \
    STARTUP_CONFIG_CACHE=1 \
    STARTUP_ROUTE_CACHE=1 \
    STARTUP_OPTIMIZE=1 \
    PHP_MAX_CHILDREN=2 \
    XDEBUG_IDE_KEY=PHPSTORM \
    XDEBUG_REMOTE_HOST=docker.for.mac.localhost \
    HORIZON_SPECIFIC_1=0 \
    HORIZON_SPECIFIC_2=0 \
    SOCKLOG_TIMESTAMP_FORMAT=


COPY root/ /

WORKDIR /var/www

EXPOSE 80
EXPOSE 443
EXPOSE 6001
