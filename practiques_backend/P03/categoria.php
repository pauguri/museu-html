<!-- Pau Guri Viura - Practica 3 -->

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

        # la consulta devuelve el nombre de la categoría con la id recibida por GET
        $result = $db -> prepare("SELECT nombre FROM P02categorias WHERE id=$_GET[id]");
        $result -> execute();
        $title = $result -> fetchColumn();

        # el título de la página (que aparece en la pestaña del navegador) muestra el nombre de la categoría correspondiente
        echo "<title>Categoría: $title</title>";
    ?>
</head>
<body>
    <?php
        include("header.php");

        require_once("conexion_pdo.php");
        $db = new Conexion();

        # la consulta devuelve, de nuevo, el nombre de la categoría con la id recibida por GET
        $result = $db -> prepare("SELECT nombre FROM P02categorias WHERE id=$_GET[id]");
        $result -> execute();
        $title = $result -> fetchColumn();
        
        # el título de la página (dentro del body) muestra el nombre de la categoría correspondiente
        echo "<h1>Categoría: $title</h1>";

        # la consulta devuelve todos los datos necesarios de los anuncios no vendidos cuya id de categoría corresponde a la id recibida por GET
        # combina 3 tablas: P02anuncios, P02usuarios y P02categorias.
        # se asigna un alias a las columnas repetidas ("id" de P02anuncios, "nombre" de P02usuarios, "nombre" de P02categorias) con el parámetro AS
        $result = $db -> prepare("SELECT P02anuncios.id AS id, titulo, P02categorias.nombre AS categoria, P02usuarios.nombre AS usuario, precio FROM P02anuncios,P02categorias,P02usuarios WHERE categoria=P02categorias.id AND propietario=email AND categoria=$_GET[id] AND vendido=0 ORDER BY fechahora DESC");
        $result -> execute();
        
        # se hace fetch de todas las filas y se cuentan con count().
        # para mostrar resultados, se tiene que recibir como mínimo 1 fila
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