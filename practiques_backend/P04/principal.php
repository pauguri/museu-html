<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Principal</title>
</head>
<body>
    <?php
        require_once("conexion_pdo.php");
        $db = new Conexion();

        $count = $db->query("SELECT COUNT(id) FROM p0422imagenes");
        $count -> execute();
        $countNum = $count -> fetchColumn();

        if($countNum <= 0){
            echo "<h2>No hay imagenes</h2>";
            return;
        }

        $result = $db->query("SELECT nombrearchivo,titulo,id FROM p0422imagenes");
        $result -> execute();

        echo "<div id='img-grid'>";
        foreach ($result as $img) {
            echo "<a class='img' href='imatge.php?id=$img[id]' style='background-image: url($img[nombrearchivo])'>$img[titulo]</a>";
        }
        echo "</div>";

        $db = null;
    ?>
</body>
</html>