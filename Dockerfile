# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dselmy <dselmy@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/24 23:58:53 by dselmy            #+#    #+#              #
#    Updated: 2020/08/24 23:59:42 by dselmy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster
WORKDIR /var/www/localhost
RUN     apt-get -y update && apt-get -y upgrade
RUN     apt-get install -y wget
RUN     apt-get install -y nginx
RUN     apt-get install -y mariadb-server
RUN     apt-get install -y mariadb-client
RUN     apt-get install -y php7.3
RUN     apt-get install -y php-fpm
RUN     apt-get install -y php-common 
RUN     apt-get install -y php-mbstring
RUN     apt-get install -y php-xmlrpc 
RUN     apt-get install -y php-soap
RUN     apt-get install -y php-gd 
RUN     apt-get install -y php-xml
RUN     apt-get install -y php-intl
RUN     apt-get install -y php-mysql
RUN     apt-get install -y php-cli
RUN     apt-get install -y php-ldap
RUN     apt-get install -y php-zip
RUN     apt-get install -y php-curl
RUN     apt-get install -y openssl
RUN     apt-get install -y curl

# installing wordpress
RUN     wget https://wordpress.org/latest.tar.gz
RUN     tar -xzf latest.tar.gz && rm -f latest.tar.gz
RUN     mv wordpress/* . && rmdir wordpress

# installing phpmyadmin
RUN     wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz
RUN     tar -xzf phpMyAdmin-4.9.5-all-languages.tar.gz && rm -f phpMyAdmin-4.9.5-all-languages.tar.gz
RUN     mv phpMyAdmin-4.9.5-all-languages phpmyadmin 
#/usr/share/phpmyadmin

# setting permission
RUN     chown -R www-data:www-data /var/www/*
RUN     chmod 777 /var/*

# generating openssl
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/localhost.key \
        -out /etc/ssl/certs/localhost.crt \
        -subj "/C=RU/ST=Moscow/L=Moscow/O=42School/OU=21/CN=dselmy/"

# copying configuration files
COPY    ./srcs/wp-config.php .
COPY    ./srcs/autoindex.sh .
RUN     rm ./wp-config-sample.php
COPY    ./srcs/start.sh .
RUN     cp ./phpmyadmin/config.sample.inc.php ./phpmyadmin/config.inc.php
COPY    ./srcs/localhost.conf /etc/nginx/sites-available/localhost
RUN     ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost \
        && rm -f /etc/nginx/sites-enabled/default

EXPOSE  80 443
RUN     chmod +x ./start.sh

ENTRYPOINT ["bash", "start.sh"]  