FROM php:7.2-fpm-alpine
LABEL maintainer westum

RUN apk --update --no-cache add \
	curl \
	g++ \
	freetype-dev \
	icu \
	icu-dev \
	libjpeg-turbo-dev \
	libpng-dev \
	libxml2-dev \
	libxslt-dev \
	shadow \
	bash \
	zlib-dev

RUN docker-php-ext-configure \
	gd --with-jpeg-dir=/usr/local/ --with-freetype-dir=/usr/include/

RUN docker-php-ext-install \
	gd \
	bcmath \
	intl \
	opcache \
	pdo_mysql \
	soap \
	xsl \
	mbstring \
	zip \
        dom \
        mcrypt


RUN apk update && apk add autoconf make
RUN pecl install xdebug-2.6.1
RUN docker-php-ext-enable xdebug
RUN echo 'xdebug.remote_host=host.docker.internal' >> /usr/local/etc/php/conf.d/xdebug.ini
RUN echo 'xdebug.remote_enable=1' >> /usr/local/etc/php/conf.d/xdebug.ini
RUN echo 'xdebug.remote_connect_back=0' >> /usr/local/etc/php/conf.d/xdebug.ini

RUN usermod -u 1000 nobody && \
	groupmod -g 1000 nobody

RUN curl -sS https://getcomposer.org/installer | php -d memory_limit=512M -- --install-dir=/usr/local/bin --filename=composer

RUN cd /tmp \
        && curl -o ioncube.tar.gz http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
    && tar -xvzf ioncube.tar.gz \
    && mv ioncube/ioncube_loader_lin_7.2.so `php-config --extension-dir` \
    && rm -rf ioncube.tar.gz ioncube \
    && docker-php-ext-enable ioncube_loader_lin_7.2

COPY ./bin/startup.sh /usr/local/bin/startup.sh
COPY ./conf/php.ini /usr/local/etc/php/php.ini
COPY ./conf/www.conf /usr/local/etc/php-fpm.d/www.conf

EXPOSE 9003
WORKDIR /var/www/html
CMD [ "sh", "/usr/local/bin/startup.sh" ]
