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
        require_once("conexion_pdo.php");
        $db = new Conexion();
        $result = $db -> prepare("SELECT titol FROM e06noticies WHERE id=$_GET[id]");
        $result -> execute();
        $title = $result -> fetchColumn();
        echo "<title>$title</title>";

        $db = NULL;
    ?>
</head>
<body>
    <?php
        require_once("conexion_pdo.php");
        $db = new Conexion();
        $result = $db -> prepare("SELECT * FROM e06noticies WHERE id=$_GET[id]");
        $result -> execute();
        $noti = $result -> fetch();
        echo "<h1>$noti[titol]</h1>
        <date>$noti[data]</date>
        <p>$noti[text]</p>
        <a class='btn' href=\"editanoticia.php?id=$noti[id]\">Editar</a>
        <a class='btn' href=\"esborranoticia.php?id=$noti[id]\">Esborrar</a>";

        $db = NULL;
    ?>
    <a class='btn' href="index.php">Tornar a l'inici</a>
</body>
</html>