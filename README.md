# DOCKERINSTALL

Herramienta creada en bash con la intención de facilitar la implementación de 4 Dockers en una instancia EC2

# COMO USAR LA HERRAMIENTA

Una vez iniciamos la instancia de AWS y tenemos una conexion via SSH entablada con nuestra máquina, realizamos los siguientes comandos

    apt update -y
  
    apt install git -y

    git clone https://github.com/Sxmpl3/dockerinstall
  
    cd dockerinstall
  
    chmod +x dockerinstall.sh
  
    ./dockerinstall.sh -d #instalaremos docker y docker-compose
  
    ./dockerinstall.sh -h #nos apareceran los argumentos disponibles para usar en la herramienta

# MySQL

    ./dockerinstall.sh -m #crearemos contenedor de mysql con reenvio de puerto 3333:3306 y obtendremos una shell del mismo para poder configurar mysql
  
    apt update -y 
  
    mysql -u root -p
  
    @Puente22
  
    create database wordpress;
  
    create database credentials;
  
    use credentials;

    create table users (username varchar(255), password varchar(255));
    

# Wordpress
  
    ./dockerinstall.sh -w

    
# Login
  
    ./dockerinstall.sh -l
    
    apt update -y
    
    apt install nano -y
    
    nano index.php
    
    Buscamos $IPPUBLICA e IPPRIVADA y cambiamos cada valor por nuestra respectiva IP Pública o Privada
    
# Register
  
    ./dockerinstall.sh -r
    
    apt update -y
    
    apt install nano -y
    
    nano index.php
    
    Buscamos $IPPUBLICA e IPPRIVADA y cambiamos cada valor por nuestra respectiva IP Pública o Privada
  
  
  
  
