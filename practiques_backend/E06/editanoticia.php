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
        echo "<title>Edita Notícia $_GET[id]</title>";
    ?>
</head>
<body>
    <h1>Edita la notícia</h1>
    <?php
        require_once("conexion_pdo.php");
        $db = new Conexion();

        $result = $db -> prepare("SELECT id,titol,text FROM e06noticies WHERE id=$_GET[id]");
        $result -> execute();
        $noti = $result -> fetch();

        echo "<form action='actualitzanoticia.php' method='POST'>
            <input type='text' name='title' placeholder='Títol' value='$noti[titol]' required></br>
            <textarea name='text' rows='8' columns='50' placeholder='Cos de la notícia' required>$noti[text]</textarea></br>
            <input type='hidden' name='id' value='$noti[id]'>
            <button type='submit'>Actualitzar</button>
            <a class='btn' href=\"index.php\">Tornar a l'inici</a>
        </form>";
        
        $db = NULL;
    ?>
</body>
</html>