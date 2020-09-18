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

FROM	debian:buster-slim
RUN     apt-get -y update && apt-get -y upgrade
RUN     apt install -y vim
RUN     apt install -y wget
RUN     apt install -y nginx
RUN     apt install -y mariadb-server
RUN     apt install -y mariadb-client
RUN     apt install -y php-fpm
RUN     apt install -y php-common 
RUN     apt install -y php-mbstring
RUN     apt install -y php-xmlrpc 
RUN     apt install -y php-soap
RUN     apt install -y php-gd 
RUN     apt install -y php-xml
RUN     apt install -y php-intl
RUN     apt install -y php-mysql
RUN     apt install -y php-cli
RUN     apt install -y php-ldap
RUN     apt install -y php-zip
RUN     apt install -y php-curl
#RUN     apt install -y openssl (еще возможно curl) - пока только здесь, надо установить на комп
# curl - заполняет поля на сайте через терминал
#RUN     apt install -y phpmyadmin

#installing wordpress
RUN     wget https://wordpress.org/latest.tar.gz
RUN     tar -xf latest.tar.gz
RUN     mv wordpress /var/www/html

#installing phpmyadmin
RUN     wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz \
        https://wordpress.org/latest.tar.gz
RUN     tar -xf phpMyAdmin-4.9.5-all-languages.tar.gz
RUN     mv phpMyAdmin-4.9.5-all-languages /usr/share/phpmyadmin && \
        cp -r /usr/share/phpmyadmin /var/www/html/phpmyadmin
#надо ли копировать в usr/share/... я хз, надо уточнить 
RUN     chown -R www-data:www-data /usr/share/phpmyadmin /var/www/html/*
#RUN     chmod 755 /var/*
# возможно надо добавить chmod 755, чтобы sql мог работать. верхняя строчка для нжникса

# openssl req ... - сгенерировать ключи openssl - гуглится (еще было бы неплохо почитать что это такое и как это работает, тот чел говорит что то про то что на локалхосте он работает не так как должен)

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/localhost.key \
        -out /etc/ssl/certs/localhost.crt \
        -subj "/C=RU/ST=Moscow/L=Moscow/O=42School/OU=21/CN=dselmy/"

COPY    ./srcs/localhost.conf /etc/nginx/sites-available/localhost
RUN     ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost \
        && rm -f /etc/nginx/sites-enabled/default
# ngnix.conf в /etc/nginx/... конфиг лежит в репе srcs
# в конфиге лежат сервера; два серввера - защищенный и незащищенный
# конфиг запускается когда говорится nginx start

# CMD - список команд, которые выполняются при запуске контейнера
# docker ps - список запущенных контейнеров
# docker run -p 80:80 443:443 открывает порты в окружении докера на нормальном окружении компа -it продолжает работать(есть какие то костыли без этого)
# если в браузере ввести localhost - откроется браузер

#start.sh - 
# nginx php7.3-fpm mysql start
# создается база данных mysql -e "..." - загуглить
# установка wp my_emal="..."; curl --data "закидываюстя данные для вордпресса без того чтобы заходить в браузер"
# через curl, зная название области, в которую можно передать данные, передаются данные "область=данные ..."
# bash - чтобы продолжал работать дебиан 

#конфиг для вордпресса - сказать вордпрессу какой базой данных пользоваться
# почти стандартный вордпрессовский конфиг
# какая то штука для ключей безопасности (все еще в стандартном конфиге)

#autoindex - скрипт, который лезет в конфиг нжинкса и меняет autoindex on на off и наоборот
# if [ .. ] - задать условие для скрипта, почитать как это делается 
# у чувака if ["$1" = "on"]; then
# sed -i "$/autoindex [onf]"/autoindex on/" /etc/nginx/sites-available/localhost"
# после этого рестартуется сервер

# nginx config
# wp config -> works with databases; several tutorials; /var/www/html/wordpress/wp-config-sample
# symbolic link from /etc/nginx/sites-available to /etc/nginx/sites-enabled (ln -s)
# all srcs files copied to docker image with COPY utilite 
# autoindex script; openssl
# в etc - конфигурационные файлы конфиги сервера в папку /etc/ngnix/ sites-enabled и sites-enabled; название файла с конфигом - название сайта (localhost)

# наполнение сайта в /var/www; html - предустановленная штука; папка localhost - для сайта;
# там лежат php странички, wordpress и т. д.


EXPOSE 80 443



#  https://websiteforstudents.com/install-wordpress-4-9-on-ubuntu-17-04-7-10-with-nginx-mariadb-and-php/
#  almost complete manual of what to do