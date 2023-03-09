<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Crear Anuncio</title>
</head>
<body>
    <?php include("header.php") ?>

    <h1>Crear Nuevo Anuncio</h1>

    <form action="insertaranuncio.php" method="POST">
        <label>Datos personales</label></br>
        <input type="text" name="nombre" placeholder="Nombre">
        <input type="email" name="email" placeholder="Email"></br>
        <label>Datos del anuncio</label></br>
        <input type="text" name="titulo" placeholder="Título" autofocus required>
        <input type="number" name="precio" placeholder="Precio" step="any" min="0" required>
        <?php
            require_once("conexion_pdo.php");
            $db = new Conexion();

            $result = $db -> query("SELECT nombre, id FROM P02categorias ORDER BY orden");

            echo "<select name='categoria' required>";
            foreach ($result as $opcion){
                echo "<option value='$opcion[id]'>$opcion[nombre]</option>";
            }
            echo "</select>";
        ?>
        <textarea name="descripcion" placeholder="Escribe aquí la descripción del producto"></textarea>
        <button type="submit">Publicar</button>
    </form>

    <?php include("footer.php") ?>
</body>
</html>