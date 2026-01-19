# Levantar una web PHP usando Docker Compose
Para lanzar una web usando docker compose vamos a crear una base de datos y una pagina web.
Requisitos: Tener una base de datos y una aplicación web php (el archivo .sql y los php's)

## Estructura de Proyecto

<img width="314" height="172" alt="image" src="https://github.com/user-attachments/assets/9d7eeee7-ad29-45fc-b248-0aecf072d18a" />


## Edicion De Documentos

### En el Dockerfile

<img width="624" height="304" alt="image" src="https://github.com/user-attachments/assets/da84415e-1855-4784-b590-f146e65eb255" />


#### comentarios
Descargamos la imagen php con apache y construimos
Montamos el contenido de app/ en la carpeta var-html dentro del contenedor
Ejecutamos permisos
E instalamos el plugin necesario para correr php con mysql
Por ultimo, expones el puerto 80 de php.

### En docker-compose.yml

<img width="765" height="589" alt="image" src="https://github.com/user-attachments/assets/2bbcee79-8e42-455a-88da-7c93910b4a2c" />

### Comentarios Finales

Entre los servicios, web usamos la que ya tenemos es decir construimos con el dockerfile, asignamos puertos, decimos que depende de otro servicio, y le conectamos a la misma red que la base de datos.

En db, usamos una imagen mysql, ponemos que siempre se reincie cuando el contenedor se apague, ponemos las variables de entorno (root como contraseña de root para el ejemplo y el nombre de la base de datos, todo estos datos deben coincidir con el que se puso en el codigo php de la web, el host seria "db", no "localhost"), usaremos dos volumenes, un volumen normal y persistente que no se guarda en la estructura de sistema de ficheros del anfitrión, que nos servira para guardar los datos, y otro que es un bind mount que sirve para colocar el primer script que ejecutará la base de datos por eso ponemos la ruta de nuestro .sql, y el network el mismo que el de la web.

Es necesario definir los volumenes y los networks que creemos.

### Imagen Docker publicada

[![Docker Image Version](https://img.shields.io/docker/v/foreignuser/docker-compose-web?label=docker%20hub)](https://hub.docker.com/repository/docker/foreignuser/docker-compose-web)


