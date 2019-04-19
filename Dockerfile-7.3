FROM lucacri/alpine-base:3.9

LABEL maintainer="lucacri@gmail.com"

ARG CACHEBUST=20190411

ARG UID=501
ARG GID=501

ARG INSTALL_PHANTOMJS=0

RUN wget -O /etc/apk/keys/php-alpine.rsa.pub https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub  && \
    apk upgrade --update-cache && \
    apk add curl ca-certificates && \
    echo "@php https://dl.bintray.com/php-alpine/v3.9/php-7.3" >> /etc/apk/repositories && \
    echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "@edge http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk update && \
    apk add \
    php@php \
    php-phar@php \
    php-json@php \
    php-openssl@php \
    php-dom@php \
    php-mysqlnd@php \
    php-mysqli@php \
    php-posix@php \
    php-pcntl@php \
    php-pdo@php \
    php-pdo_pgsql@php \
    php-pdo_sqlite@php \
    php-pdo_mysql@php \
    php-common@php \
    php-fpm@php \
    php-bcmath@php \
    php-zip@php \
    php-bz2@php \
    php-curl@php \
    php-gd@php \
    php-intl@php \
    php-sqlite3@php \
    php-ctype@php \
    php-tidy@php \
    php-pgsql@php \
    php-xml@php \
    php-mbstring@php \
    php-session@php \
    php-zlib@php \
    php-opcache@php \
    php-soap@php \
    php-xdebug@php \
    php-imagick@php \
    php-exif@php \
    php-xmlreader@php \
    php-iconv@php \
    ghostscript \
    ghostscript-dev \
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
    chown -Rf nginx:nginx /var/tmp/nginx && \
    chown -Rf nginx:nginx /var/lib/nginx && \
    composer global require hirak/prestissimo && \
    composer global clear-cache


ENV ENABLE_CRON=1 \
    ENABLE_HORIZON=0 \
    ENABLE_WEB=1 \
    ENABLE_LOGS=1 \
    STARTUP_MIGRATE=1 \
    STARTUP_CONFIG_CACHE=1 \
    STARTUP_ROUTE_CACHE=1 \
    STARTUP_OPTIMIZE=1 \
    ENABLE_XDEBUG=0 \
    XDEBUG_IDE_KEY=PHPSTORM \
    XDEBUG_REMOTE_HOST=docker.for.mac.localhost \
    PHP_MAX_CHILDREN=2 \
    ENABLE_OPCACHE=1

COPY root/ /

WORKDIR /var/www

EXPOSE 80
EXPOSE 443
