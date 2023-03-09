<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <?php
        require_once("conexion_pdo.php");
        $db = new Conexion();

        $result = $db -> prepare("SELECT nombre FROM P02categorias WHERE id=$_GET[id]");
        $result -> execute();
        $title = $result -> fetchColumn();
        echo "<title>Categoría: $title</title>";
    ?>
</head>
<body>
    <?php
        include("header.php");

        require_once("conexion_pdo.php");
        $db = new Conexion();

        $result = $db -> prepare("SELECT nombre FROM P02categorias WHERE id=$_GET[id]");
        $result -> execute();
        $title = $result -> fetchColumn();
        echo "<h1>Categoría: $title</h1>";

        $result = $db -> prepare("SELECT P02anuncios.id AS id, titulo, P02categorias.nombre AS categoria, P02usuarios.nombre AS usuario, precio FROM P02anuncios,P02categorias,P02usuarios WHERE categoria=P02categorias.id AND propietario=email AND categoria=$_GET[id] AND vendido=0 ORDER BY fechahora DESC");
        $result -> execute();
        $allRows = $result -> fetchAll();
        if(count($allRows) < 1) {
            echo "<h2>No se han encontrado anuncios para esta categoría.</h2>";
        } else {
            $result -> execute();

            echo "<div class='postgrid'>";

            foreach ($result as $post) {
                echo "<article>
                    <h2><a href='anuncio.php?id=$post[id]'>$post[titulo]</a></h2>
                    <h2>$post[categoria]</h2>
                    <h3>$post[usuario]</h3>
                    <h3>$post[precio] €</h3>
                </article>";
            }
            echo "</div>";
        }

        $db = NULL;

        include("footer.php");
    ?>
</body>
</html>