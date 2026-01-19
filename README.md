# Levantar una web PHP usando Docker Compose
Para lanzar una web usando docker compose vamos a crear una base de datos y una pagina web.
Requisitos: Tener una base de datos y una aplicación web php (el archivo .sql y los php's)

## Estructura de Proyecto

PR1/
├── docker-compose.yml
├── Dockerfile
├── app/
│   └── index.php
└── db/
    └── database.sql

## Edicion De Documentos

### En el Dockerfile

FROM php:8.2-apache

COPY app/ /var/www/html/

RUN chown -R www-data:www-data /var/www/html

RUN docker-php-ext-install mysqli

EXPOSE 80

#### comentarios
Descargamos la imagen php con apache y construimos
Montamos el contenido de app/ en la carpeta var-html dentro del contenedor
Ejecutamos permisos
E instalamos el plugin necesario para correr php con mysql
Por ultimo, expones el puerto 80 de php.

### En docker-compose.yml

<img width="765" height="589" alt="image" src="https://github.com/user-attachments/assets/2bbcee79-8e42-455a-88da-7c93910b4a2c" />

Entre los servicios, web usamos la que ya tenemos es decir construimos con el dockerfile, asignamos puertos, decimos que depende de otro servicio, y le conectamos a la misma red que la base de datos.

En db, usamos una imagen mysql, ponemos que siempre se reincie cuando el contenedor se apague, ponemos las variables de entorno (root como contraseña de root para el ejemplo y el nombre de la base de datos, todo estos datos deben coincidir con el que se puso en el codigo php de la web, el host seria "db", no "localhost"), usaremos dos volumenes, un volumen normal y persistente que no se guarda en la estructura de sistema de ficheros del anfitrión, que nos servira para guardar los datos, y otro que es un bind mount que sirve para colocar el primer script que ejecutará la base de datos por eso ponemos la ruta de nuestro .sql, y el network el mismo que el de la web.

Es necesario definir los volumenes y los networks que creemos.



