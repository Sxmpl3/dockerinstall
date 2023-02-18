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

    echo -e "\n[-] Instalando docker y las imagenes necesarias...(esto puede llevar algo de tiempo)"
    apt install docker docker-compose -y > /dev/null 2>&1
    apt update -y -qq
    echo -e ""
    docker pull wordpress > /dev/null 2>&1
    docker pull mysql > /dev/null 2>&1
    docker pull nicogarcia05/login-app > /dev/null 2>&1
    docker pull nicogarcia05/register-app > /dev/null 2>&1
    echo -e "\n[+] Instalado con éxito"
fi

if [[ $1 == "-w" ]];then
    
    echo -e "\n[-] Iniciando contenedor de Wordpress en el puerto 80..."
    docker container run -d --name wordpress -p 80:80 wordpress > /dev/null 2>&1
    echo -e ""
    echo -e "\n[+] Iniciado con éxito"
fi

if [[ $1 == "-m" ]];then
    
    echo -e "\n[-] Iniciando contenedor de MySQL en el puerto 3333..."
    docker run --name mysql -e MYSQL_ROOT_PASSWORD=@Puente22 -d -p 3333:3306 mysql > /dev/null 2>&1
    echo -e ""
    MYSQL=$(docker ps | awk 'NR==2{print $1}') > /dev/null 2>&1
    echo -e ""
    echo -e "\n[+] Accediendo al contenedor mediante una /bin/bash..."
    docker exec -it $MYSQL /bin/bash  > /dev/null 2>&1
    # UNA VEZ EJECUTADO EL COMANDO REVISAR EL README
fi

if [[ $1 == "-l" ]];then
    
   echo -e "\n[-] Iniciando contenedor de Login en el puerto 8080..."
   docker container run -d -p 8080:80 --name login httpd:2.4 > /dev/null 2>&1
   LOGIN=$(docker ps | awk 'NR==2{print $1}') > /dev/null 2>&1
   docker exec -it $LOGIN /bin/bash > /dev/null 2>&1
   echo -e ""
   echo -e "\n[+] Iniciado con éxito"
fi 

if [[ $1 == "-r" ]];then

   echo -e "\n[-] Iniciando contenedor de Register en el puerto 8081..."
   docker container run -d -p 8081:80 --name register httpd:2.4
   REGISTER=$(docker ps | awk 'NR==2{print $1}')
   docker exec -it $REGISTER /bin/bash
   echo -e ""
   echo -e "\n[+] Iniciado con éxito"
fi


