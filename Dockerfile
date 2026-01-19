FROM php:8.2-apache

# Copia la aplicación al contenedor

COPY app/ /var/www/html/

# Permisos

RUN chown -R www-data:www-data /var/www/html

# Instala dependencias

RUN docker-php-ext-install mysqli

EXPOSE 80
