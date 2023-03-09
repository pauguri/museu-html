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
    <title>Panell de control</title>
</head>
<body>
    <h1>Panell de control</h1>
    <?php
        require_once("conexion_pdo.php");
        $db = new Conexion();

        $result = $db->query("SELECT id,titol FROM e06noticies WHERE visible=1");
        
        echo "<ul>";
        foreach($result as $noti){
            echo "<li><div><a href=\"detallnoticia.php?id=$noti[id]\">$noti[titol]</a></div>
                <a class='btn' href=\"editanoticia.php?id=$noti[id]\">Editar</a>
                <a class='btn' href=\"esborranoticia.php?id=$noti[id]\">Esborrar</a>
            </li>";
        }
        echo "</ul>";

        $db = NULL;
    ?>
    <a class='btn' href="buscador.php">Buscar</a>
    <a class='btn' href="novanoticia.php">+ Nova notícia</a>
    <a class='btn' href="logout.php">Tancar Sessió</a>
</body>
</html>