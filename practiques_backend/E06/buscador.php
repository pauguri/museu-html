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
<h1>Buscador</h1>
    <form action="busquedasimple.php" method="GET">
        <input type="text" name="q" placeholder="Escriu la teva búsqueda" autofocus required></br>
        <button type="submit">Buscar (Simple)</button>
        <button type="submit" formaction="busquedafulltext.php">Buscar (Full Text)</button>
        <a class='btn' href="index.php">Tornar a l'inici</a>
    </form>
</body>
</html>