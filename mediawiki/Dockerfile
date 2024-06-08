# Use the CentOS base image
FROM centos:7

# Install the required packages
RUN yum install -y centos-release-scl && \
    yum install -y httpd24-httpd rh-php73 rh-php73-php rh-php73-php-mbstring rh-php73-php-mysqlnd rh-php73-php-gd rh-php73-php-xml mariadb-server mariadb wget gnupg && \
    yum clean all

# Enable the necessary services and set up directories
RUN mkdir -p /opt/rh/httpd24/root/var/www/html && \
    mkdir -p /opt/rh/rh-php73/root/var/www/html && \
    chown -R apache:apache /opt/rh/httpd24/root/var/www/html && \
    chown -R apache:apache /opt/rh/rh-php73/root/var/www/html

# Download and verify MediaWiki
ENV MEDIAWIKI_VERSION 1.41.1
RUN cd /opt/rh/httpd24/root/var/www/html && \
    wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-${MEDIAWIKI_VERSION}.tar.gz && \
    wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-${MEDIAWIKI_VERSION}.tar.gz.sig && \
    gpg --verify mediawiki-${MEDIAWIKI_VERSION}.tar.gz.sig mediawiki-${MEDIAWIKI_VERSION}.tar.gz && \
    tar -xvzf mediawiki-${MEDIAWIKI_VERSION}.tar.gz && \
    ln -s mediawiki-${MEDIAWIKI_VERSION} mediawiki && \
    chown -R apache:apache mediawiki-${MEDIAWIKI_VERSION} && \
    rm mediawiki-${MEDIAWIKI_VERSION}.tar.gz mediawiki-${MEDIAWIKI_VERSION}.tar.gz.sig

# Set environment variables for PHP and Apache
ENV PATH="/opt/rh/rh-php73/root/usr/bin:/opt/rh/httpd24/root/usr/bin:$PATH"

# Expose port 80
EXPOSE 80

# Start Apache server
CMD ["/opt/rh/httpd24/root/usr/sbin/httpd-scl-wrapper", "-D", "FOREGROUND"]