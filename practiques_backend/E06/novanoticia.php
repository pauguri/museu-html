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
    <form action="insereixnoticia.php" method="POST">
        <input type="text" name="title" placeholder="Títol" autofocus required></br>
        <textarea name="text" rows="8" columns="50" placeholder="Cos de la notícia" required></textarea></br>
        <button type="submit">Crear</button>
        <a class='btn' href="index.php">Tornar a l'inici</a>
    </form>
</body>
</html>