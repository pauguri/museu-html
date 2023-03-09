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
    <title>Buscador</title>
</head>
<body>
    <h1>Resultats de Búsqueda (Simple)</h1>
    <?php
        require_once("conexion_pdo.php");
        $db = new Conexion();

        $queryString = $_GET['q'];
        $result = $db -> prepare("SELECT id,titol FROM e06noticies WHERE visible=1 AND (titol LIKE :qString OR text LIKE :qString)");
        $result -> execute(array(":qString"=>"%".$queryString."%"));
        
        $resultArray = $result -> fetchAll();
        $count = count($resultArray);
        echo $count . ($count==1 ? " resultat" : " resultats");

        $result -> execute(array(":qString"=>"%".$queryString."%"));

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
    <a class='btn' href="index.php">Tornar a l'inici</a>
</body>
</html>