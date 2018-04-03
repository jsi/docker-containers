FROM enoniccloud/apache2-letsencrypt
COPY myvhost.conf /etc/apache2/sites-enabled/myvhost.conf

RUN a2enmod proxy_wstunnel
RUN a2enmod proxy_http
RUN a2enmod rewrite
RUN a2enmod headers
