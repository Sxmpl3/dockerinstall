#!/bin/bash

# SCRIPT CREADO PARA LA INSTALACION DE FORMA AUTOMATICA 4 DOCKERS DISTINTOS EN UNA INSTANCIA EC2 DE AMAZON, CADA CONTENEDOR SE REENVIA A OTRO PUERTO DISTINTO

if [[ $1 == "" ]];then

    echo -e "[USE EL SIGUIENTE PARAMETRO PARA APRENDER USAR LA HERRAMIENTA]"
    echo -e "--------------------------------------------------------------"
    echo -e "root@0.0.0.0: /home/admin# ./dockerinstall.sh -h"
    echo ""
fi

if [[ $1 == "-h" ]];then

    echo -e "Script creado por https://github.com/Sxmpl3"
    echo -e "-------------------------------------------"
    echo -e "./dockerinstall.sh -d [INSTALACION DE DOCKER]"
    echo -e "./dockerinstall.sh -w [INSTALACION DE CONTENEDOR WORDPRESS]"
    echo -e "./dockerinstall.sh -m [INSTALACION DE CONTENEDOR MARIADB]"
    echo -e "./dockerinstall.sh -l [INSTALACION DE CONTENEDOR LOGIN]"
    echo -e "./dockerinstall.sh -r [INSTALACION DE CONTENEDOR REGISTER]"
    echo -e ""
fi

if [[ $1 == "-d" ]];then

    apt install docker docker-compose -y
    apt update
    docker pull node
    docker pull wordpress
    docker pull mysql
    docker pull php
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
    
    docker container run -d -p 8080:3000 --name login -w /home/admin/dockerinstall/login node npm start
fi

if [[ $1 == "-r" ]];then
    
    docker container run -d -p 8081:3001 --name register -w /home/admin/dockerinstall/register node npm start
fi


