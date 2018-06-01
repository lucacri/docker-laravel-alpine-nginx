FROM lucacri/alpine-base:3.7.1

LABEL maintainer="lucacri@gmail.com"

ARG UID=501
ARG GID=501

ARG INSTALL_PHANTOMJS=0

RUN apk upgrade --update-cache && \
    apk add curl ca-certificates && \
    curl https://php.codecasts.rocks/php-alpine.rsa.pub -o /etc/apk/keys/php-alpine.rsa.pub && \
    echo "@php https://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories && \
    echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && \
    apk add \
    php7@php \
    php7-phar@php \
    php7-json@php \
    php7-openssl@php \
    php7-dom@php \
    php7-mysqlnd@php \
    php7-mysqli@php \
    php7-posix@php \
    php7-pcntl@php \
    php7-pdo@php \
    php7-pdo_pgsql@php \
    php7-pdo_sqlite@php \
    php7-pdo_mysql@php \
    php7-common@php \
    php7-fpm@php \
    php7-bcmath@php \
    php7-zip@php \
    php7-bz2@php \
    php7-curl@php \
    php7-gd@php \
    php7-intl@php \
    php7-sqlite3@php \
    php7-ctype@php \
    php7-tidy@php \
    php7-pgsql@php \
    php7-xml@php \
    php7-mbstring@php \
    php7-session@php \
    php7-zlib@php \
    php7-opcache@php \
    php7-soap@php \
    php7-xdebug@php \
    php7-imagick@php \
    php7-exif@php \
    ghostscript \
    ghostscript-dev \
    nano \
    nodejs \
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
    chown -Rf nginx:nginx /var/tmp/nginx && \
    chown -Rf nginx:nginx /var/lib/nginx


ENV ENABLE_CRON=1 \
    ENABLE_HORIZON=0 \
    ENABLE_WEB=1 \
    ENABLE_LOGS=1 \
    STARTUP_MIGRATE=1 \
    STARTUP_CONFIG_CACHE=1 \
    STARTUP_ROUTE_CACHE=1 \
    ENABLE_XDEBUG=0 \
    XDEBUG_IDE_KEY=PHPSTORM \
    XDEBUG_REMOTE_HOST=docker.for.mac.localhost \
    PHP_MAX_CHILDREN=2 \
    ENABLE_OPCACHE=1

COPY root/ /

WORKDIR /var/www

EXPOSE 80
EXPOSE 443
