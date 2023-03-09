<!DOCTYPE html>
<?php
    require("session_check.php");
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Notícies</title>
</head>
<body>
    <h1>Esborra Notícia</h1>
    <?php
        require_once("conexion_pdo.php");
        $db = new Conexion();

        $consulta = "DELETE FROM e06noticies WHERE id=$_GET[id]";
        $result = $db -> prepare($consulta);
        if($result -> execute()){
            echo "<h3>Notícia eliminada correctament</h2>";
        } else {
            echo "<h3>Error al esborrar la notícia</h3>";
            echo "Error: " . $result-> errorCode();
        }
        echo "<br><a href=\"index.php\">Tornar a l'inici</a>";

        $db = NULL;
    ?>
</body>
</html>