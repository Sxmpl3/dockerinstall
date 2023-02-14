#!/bin/bash

# COMANDOS ESENCIALES
# LISTAR DOCKERS -> docker ps
# SHELL DE CONTENEDOR DOCKER -> docker exec -it id /bin/bash

# AL CONECTARNOS A LA SHELL HACER UPDATE E INSTALAR NANO, EN EL DIRECTORIO /usr/local/apache2/htdocs/ SE ENCONTRARA EL index.html

# MYSQL: create database wordpress; | create database user; | use user; | create table credenciales (username varchar(255), password varchar(255));

if [[ $1 == "" ]];then

    echo -e "[USE EL SIGUIENTE PARAMETRO PARA APRENDER USAR LA HERRAMIENTA]"
    echo -e "--------------------------------------------------------------"
    echo -e "root@0.0.0.0: /home/admin# ./dockerinstall.sh -h"
    echo ""
fi

if [[ $1 == "-h" ]];then

    echo -e "Script creado por https://github.com/Sxmpl3"
    echo -e "-------------------------------------------"
    echo -e "-d [INSTALACION DE DOCKER]"
    echo -e "-w [INSTALACION DE CONTENEDOR WORDPRESS]"
    echo -e "-m [INSTALACION DE CONTENEDOR MARIADB]"
    echo -e "-l [INSTALACION DE CONTENEDOR LOGIN]"
    echo -e "-r [INSTALACION DE CONTENEDOR REGISTER]"
    echo -e ""
fi

if [[ $1 == "-d" ]];then

    apt install docker docker-compose -y
    apt update
fi

if [[ $1 == "-w" ]];then

    docker container run -d --name wordpress -p 80:80 wordpress
fi

if [[ $1 == "-m" ]];then

    docker run --name mysql -e MYSQL_ROOT_PASSWORD=@Puente22 -d -p 3333:3306 mysql
    MYSQL=$(docker ps | awk 'NR==2{print $1}') 
    docker exec -it $MYSQL /bin/bash
    # UNA VEZ EJECUTADO EL COMANDO REVISAR EL README
fi

if [[ $1 == "-l" ]];then
    
    docker run -d --name login -p 8080:80 httpd:2.4
    LOGIN=$(docker ps | awk 'NR==2{print $1}') 
    docker exec -it $LOGIN /bin/bash
    # UNA VEZ EJECUTADO EL COMANDO REVISAR EL README
fi

if [[ $1 == "-r" ]];then
    
    docker run -d --name register -p 8081:80 httpd:2.4
    REGISTER=$(docker ps | awk 'NR==2{print $1}') 
    docker exec -it $REGISTER /bin/bash
    # UNA VEZ EJECUTADO EL COMANDO REVISAR EL README
fi


