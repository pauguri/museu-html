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
    <?php
        echo "<title>Edita Notícia $_POST[id]</title>";
    ?>
</head>
<body>
    <h1>Edita la notícia</h1>
    <?php
        require_once("conexion_pdo.php");
        $db = new Conexion();

        $consulta = "UPDATE e06noticies SET titol=:titol, text=:text WHERE id=$_POST[id]";
        $result = $db -> prepare($consulta);
        if($result -> execute(array(":titol" => $_POST['title'], ":text" => $_POST['text']))){
            echo "<h3>Notícia actualitzada correctament</h3>";
        } else {
            echo "<h3>Error a l'actualitzar la notícia</h3>";
            echo "Error: " . $result-> errorCode();
        }
        echo "<br><a href=\"index.php\">Tornar a l'inici</a>";

        $db = NULL;
    ?>
</body>
</html>