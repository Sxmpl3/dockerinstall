<?php
$servername = "$IPPRIVADA:3333"; // dirección IP del contenedor de la base de datos y el puerto
$username = "root"; // nombre de usuario de la base de datos
$password = "@Puente22"; // contraseña de la base de datos
$dbname = "credentials"; // nombre de la base de datos

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Verificar si se ha enviado el formulario
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  // Obtener las credenciales ingresadas por el usuario
  $username = $_POST['username'];
  $password = $_POST['password'];

  // Consultar la base de datos para verificar las credenciales
  $sql = "SELECT * FROM users WHERE username='$username' AND password='$password'";
  $result = $conn->query($sql);

  if ($result->num_rows == 2) {
    // Credenciales válidas, redirigir al usuario a Wordpress en el puerto 80
    header("Location: http://$IPPUBLICA:80");
    exit();
  } else {
    // Credenciales inválidas, mostrar un mensaje de error
    echo "Usuario o contraseña incorrectos";
  }
}
?>

<!-- Formulario de inicio de sesión -->
<form method="post">
  <label for="username">Usuario:</label>
  <input type="text" id="username" name="username"><br>

  <label for="password">Contraseña:</label>
  <input type="password" id="password" name="password"><br>

  <input type="submit" value="Iniciar sesión">
</form>