USE credentials;
CREATE TABLE users (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(30) NOT NULL,
  password VARCHAR(30) NOT NULL
);
INSERT INTO users (username, password) VALUES
  ('usuario1', 'clave1'),
  ('usuario2', 'clave2');
