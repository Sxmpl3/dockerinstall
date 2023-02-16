<?php
// Establecemos la conexión con la base de datos
$servername = "localhost";
$username = "root";
$password = "password";
$dbname = "credentials";
$port = "3333";

$conn = mysqli_connect($servername, $port, $username, $password, $dbname);

// Comprobamos si la conexión es exitosa
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

// Comprobamos si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  // Recibimos los datos del formulario
  $username = $_POST["username"];
  $password = $_POST["password"];
  $email = $_POST["email"];

  // Encriptamos la contraseña
  $password = password_hash($password, PASSWORD_DEFAULT);

  // Insertamos los datos en la tabla de usuarios
  $sql = "INSERT INTO users (username, password, email) VALUES ('$username', '$password', '$email')";

  if (mysqli_query($conn, $sql)) {
    // Si se ha insertado correctamente, redirigimos al usuario a la página de login
    header("Location: http://localhost:80");
    exit();
  } else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
  }
}

mysqli_close($conn);
?>
<!DOCTYPE html>
<html>
<head>
  <title>Register</title>
</head>
<body>
  <h1>Register</h1>
  <form method="post">
    <label>Username:</label>
    <input type="text" name="username" required><br>
    <label>Password:</label>
    <input type="password" name="password" required><br>
    <label>Email:</label>
    <input type="email" name="email" required><br>
    <input type="submit" value="Register">
  </form>
</body>
</html>