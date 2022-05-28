FROM wordpress:latest
ENV TZ Asia/Tokyo
RUN apt-get update && apt-get install -y \
    msmtp \
    msmtp-mta 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && wp --info
WORKDIR /var/www/html
COPY ./customphp.ini $PHP_INI_DIR/conf.d/
COPY ./msmtprc /etc/msmtprc
RUN chown www-data:www-data /etc/msmtprc && chmod 600 /etc/msmtprc