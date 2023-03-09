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
    <title>Nova Notícia</title>
</head>
<body>
    <h1>Crea una nova notícia</h1>
    <?php
        require_once("conexion_pdo.php");
        $db = new Conexion();

        $dataNoticia = date('Y-m-d');

        $consulta = "INSERT INTO e06noticies(titol,text,data,visible) VALUE (:titol,:text,\"$dataNoticia\",1)";
        $result = $db->prepare($consulta);
        

        if($result -> execute(array(":titol" => $_POST['title'], ":text" => $_POST['text']))){
            echo "<h3>Notícia creada correctament</h3>";
        } else {
            echo "<h3>Nos s'ha pogut esborrar la notícia</h3>";
            echo "Error: " . $result-> errorCode();
        }
        echo "<br><a class='btn' href=\"index.php\">Tornar a l'inici</a>";

        $db = NULL;
    ?>
</body>
</html>