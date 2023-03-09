<!-- Pau Guri Viura - Practica 3 -->

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

        # en estas variables se guarda la ip pública del usuario y la fecha y hora actuales
        $fechahora = date("Y-m-d H:i:s");
        $ip = $_SERVER['REMOTE_ADDR'];

        # la consulta devuelve la cantidad de emails que coinciden con el email recibido por POST
        $queryEmail = $db -> prepare("SELECT COUNT(email) FROM P02usuarios WHERE email = :email");
        $queryEmail -> execute(array(":email" => $_POST['email']));
        
        # si la consulta devuelve 0 (el email no está registrado en la BBDD), se inserta junto con el nombre del usuario
        if($queryEmail -> fetchColumn() < 1) {
            $insertQuery = $db -> prepare("INSERT INTO P02usuarios(email, nombre) VALUE (:email, :nombre)");
            $insertQuery -> execute(array(":email" => $_POST['email'], ":nombre" => $_POST['nombre']));
        }

        # la consulta inserta una nueva fila en la tabla P02anuncios con los datos recibidos por POST, la ip del usuario y la fecha y hora actual
        # en la columna 'vendido' se inserta siempre el valor 0, ya que se supone que al publicar un anuncio este no estará vendido
        $result = $db -> prepare("INSERT INTO P02anuncios(titulo, precio, descripcion, ip, vendido, fechahora, categoria, propietario)
            VALUE (:titulo, :precio, :descripcion, '$ip', 0, '$fechahora', :categoria, :propietario)");
        
        # al ejecutar la consulta, se comprueba si se ha ejecutado correctamente.
        # si hay un error, no se imprimen todos los detalles (el usuario no los tiene que saber) pero sí un código de error discreto para poder diagnosticarlo
        if( $result -> execute(array(":titulo" => $_POST['titulo'], ":precio" => $_POST['precio'], ":descripcion" => $_POST['descripcion'], ":categoria" => $_POST['categoria'], ":propietario" => $_POST['email'])) ){
            echo "<h2>Anuncio publicado correctamente.</h2>";
        } else {
            echo "<h3>Error al publicar la notícia</h3>";
            echo "Error: " . $result-> errorCode();
        }

        $db = NULL;
    ?>
    <a href="index.php">Volver al inicio</a>

    <?php include("footer.php") ?>
</body>
</html>