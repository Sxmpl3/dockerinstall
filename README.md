# DOCKERINSTALL

Herramienta creada en bash con la intención de facilitar la implementación de 4 Dockers en una instancia EC2


# COMO USAR LA HERRAMIENTA

Una vez iniciamos la instancia de AWS y tenemos una conexion via SSH entablada con nuestra máquina, realizamos los siguientes comandos

  1: apt update -y
  
  2: apt install git -y

  3: git clone https://github.com/Sxmpl3/dockerinstall
  
  4: cd dockerinstall
  
  5: chmod +x dockerinstall.sh
  
  6: ./dockerinstall.sh -d (instalaremos docker y docker-compose)
  
  7: ./dockerinstall.sh -h (nos apareceran los argumentos disponibles para usar en la herramienta)

# MySQL

  1: ./dockerinstall.sh -m
  
  2: apt update -y 
  
  3: mysql -u root -p
  
  4: @Puente22
  
  5: create database wordpress;
  
  6: create database credentials;
  
  7: use credentials;
  
  8: 
  
  # Wordpress
  
    1: ./dockerinstall.sh -w
    
# Login
  
    1: ./dockerinstall.sh -l
    
# Register
  
    1: ./dockerinstall.sh -r
  
  
  
  
