service php7.3-fpm start
service nginx start
service mysql start

mysql -e "CREATE DATABASE dselmy_db;"
mysql -e "CREATE USER 'dselmy'@'localhost' IDENTIFIED BY 'admin';"
mysql -e "GRANT ALL ON dselmy_db.* TO 'dselmy'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

bash