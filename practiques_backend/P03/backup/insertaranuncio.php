<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Crear Anuncio</title>
</head>
<body>
    <?php include("header.php") ?>

    <h1>Crear Nuevo Anuncio</h1>

    <?php
        require_once("conexion_pdo.php");
        $db = new Conexion();

        $fechahora = date("Y-m-d H:i:s");
        $ip = $_SERVER['REMOTE_ADDR'];

        $queryEmail = $db -> prepare("SELECT COUNT(email) FROM P02usuarios WHERE email = :email");
        $queryEmail -> execute(array(":email" => $_POST['email']));
        if($queryEmail -> fetchColumn() < 1) {
            $insertQuery = $db -> prepare("INSERT INTO P02usuarios(email, nombre) VALUE (:email, :nombre)");
            $insertQuery -> execute(array(":email" => $_POST['email'], ":nombre" => $_POST['nombre']));
        }

        $result = $db -> prepare("INSERT INTO P02anuncios(titulo, precio, descripcion, ip, vendido, fechahora, categoria, propietario)
            VALUE (:titulo, :precio, :descripcion, '$ip', 0, '$fechahora', :categoria, :propietario)");
        if( $result -> execute(array(":titulo" => $_POST['titulo'], ":precio" => $_POST['precio'], ":descripcion" => $_POST['descripcion'], ":categoria" => $_POST['categoria'], ":propietario" => $_POST['email'])) ){
            echo "<h2>Anuncio publicado correctamente.</h2>";
        } else {
            echo "<h3>Error al publicar la notícia</h3>";
            echo "Error: " . $result-> errorCode();
        }
    ?>
    <a href="index.php">Volver al inicio</a>

    <?php include("footer.php") ?>
</body>
</html>