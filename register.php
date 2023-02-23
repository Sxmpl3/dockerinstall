<?php
$servername = "$IPPRIVADA:3333"; // dirección IP del contenedor de la base de datos y el puerto
$username = "root"; // nombre de usuario de la base de datos
$password = "@Puente22"; // contraseña de la base de datos
$dbname = "credentials"; // nombre de la base de datos

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Procesamiento del formulario de registro
if (isset($_POST['submit'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    // Añade más campos aquí si lo necesitas

    // Validación de datos (por ejemplo, verificar si el nombre de usuario ya existe en la base de datos)

    // Insertar datos en la base de datos
    $sql = "INSERT INTO users (username, password) VALUES ('$username', '$password')";
    mysqli_query($conn, $sql);

    // Redireccionar al puerto 8080
    header("Location: http://$IPPUBLICA:8080/");
    exit();
}
?>

<!-- Formulario de registro -->
<form method="POST">
    <label for="username">Nombre de usuario:</label>
    <input type="text" id="username" name="username">

    <label for="password">Contraseña:</label>
    <input type="password" id="password" name="password">

    <!-- Añade más campos aquí si lo necesitas -->

    <input type="submit" name="submit" value="Registrarse">
</form>

