<?php
// Iniciamos la sesión
session_start();

// Comprobamos si ya hay una sesión iniciada
if (isset($_SESSION["username"])) {
  // Si ya hay una sesión iniciada, redirigimos al usuario a la página de bienvenida
  header("Location: http://localhost:8080/welcome.php");
  exit();
}

// Comprobamos si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
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

  // Recibimos los datos del formulario
  $username = $_POST["username"];
  $password = $_POST["password"];

  // Buscamos al usuario en la base de datos
  $sql = "SELECT * FROM users WHERE username='$username'";
  $result = mysqli_query($conn, $sql);

  if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    // Verificamos la contraseña
    if (password_verify($password, $row["password"])) {
      // Si la contraseña es correcta, iniciamos la sesión y redirigimos al usuario a la página de bienvenida
      $_SESSION["username"] = $row["username"];
      header("Location: http://localhost:8080/welcome.php");
      exit();
    }
  }

  // Si no se ha iniciado la sesión, mostramos un mensaje de error
  $error = "Invalid username or password";
}

?>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
</head>
<body>
  <h1>Login</h1>
  <?php
  // Mostramos un mensaje de error si es necesario
  if (isset($error)) {
    echo "<p>$error</p>";
  }
  ?>
  <form method="post">
    <label>Username:</label>
    <input type="text" name="username" required><br>
    <label>Password:</label>
    <input type="password" name="password" required><br>
    <input type="submit" value="Login">
  </form>
  <p>Don't have an account? <a href="http://localhost:8081/register.php">Register</a></p>
</body>
</html>