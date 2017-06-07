FROM jasonzou/alpine-base:latest

# ensure www-data user exists
#RUN set -x && \
    #addgroup -g 82 -S www-data && \
    #adduser -u 82 -D -S -G www-data www-data

# Install apache httpd
RUN apk add --update apache2  && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /run/apache2

# Add the files
ADD root /

COPY files/httpd.conf /etc/apache2/.

# EntryPoint
ENTRYPOINT ["/init"]

CMD []

# Expose the ports for httpd and sshd
EXPOSE 22 80
