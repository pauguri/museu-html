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

        # la consulta devuelve el título del anuncio con la id recibida por GET
        $result = $db -> prepare("SELECT titulo FROM P02anuncios WHERE id=$_GET[id]");
        $result -> execute();
        $title = $result -> fetchColumn();
        
        # el título de la página (que aparece en la pestaña del navegador) muestra el título del anuncio correspondiente
        echo "<title>Anuncio: $title</title>";
    ?>
</head>
<body>
    <?php
        include("header.php");

        require_once("conexion_pdo.php");
        $db = new Conexion();

        # la consulta devuelve todos los datos necesarios del anuncio con la id recibida por GET.
        # combina 3 tablas: P02anuncios, P02usuarios y P02categorias.
        # se asigna un alias a las columnas repetidas ("id" de P02anuncios, "nombre" de P02usuarios, "nombre" de P02categorias) con el parámetro AS
        $result = $db -> prepare("SELECT P02anuncios.id AS id, titulo, descripcion, P02categorias.nombre AS nombreCategoria, P02usuarios.nombre AS usuario, precio, fechahora, vendido, categoria AS idCategoria FROM P02anuncios,P02categorias,P02usuarios WHERE categoria=P02categorias.id AND propietario=email AND P02anuncios.id=$_GET[id]");
        $result -> execute();
        $post = $result -> fetch();
    
        # la fecha y la hora de la string fechahora se separan y se guardan en un array para acceder a cada elemento por separado
        $datetimeArray = explode(" ", $post['fechahora']);

        # El operador ternario comprueba qué valor tiene la columna "vendido" e imprime el texto correspondiente
        # En el tag <time> se imprime la hora pero se eliminan los segundos con substr() (mostrar los segundos no creo que sea relevante)
        echo "<h1>$post[titulo]</h1>
            <p>". ($post['vendido'] == 1 ? "Vendido" : "En venta") ."</p>
            <date>$datetimeArray[0]</date></br>
            <time>". substr($datetimeArray[1],0,5) ."</time>
            <h2>$post[nombreCategoria]</h2>
            <h3>$post[precio] €</h3>
            <p>$post[descripcion]</p>
            <h3>$post[usuario]</h3>";

        # la consulta devuelve el nombre de la categoría con la id correspondiente (la id de la categoría del anuncio de arriba)
        $result = $db -> prepare("SELECT nombre FROM P02categorias WHERE id=$post[idCategoria]");
        $result -> execute();
        $title = $result -> fetchColumn();
        echo "</br><h2>Más anuncios de la categoria: $title</h2>";

        # la consulta devuelve las columnas necesarias de todos los anuncios no vendidos de la categoria correspondiente
        # combina 3 tablas: P02anuncios, P02usuarios y P02categorias.
        # se asigna un alias a las columnas repetidas ("id" de P02anuncios, "nombre" de P02usuarios, "nombre" de P02categorias) con el parámetro AS
        $result = $db -> prepare("SELECT P02anuncios.id AS id, titulo, P02categorias.nombre AS nombreCategoria, P02usuarios.nombre AS usuario, precio FROM P02anuncios,P02categorias,P02usuarios WHERE categoria=P02categorias.id AND propietario=email AND categoria=$post[idCategoria] AND P02anuncios.id <> $_GET[id] AND vendido=0 ORDER BY fechahora DESC");
        $result -> execute();

        # se hace fetch de todas las filas y se cuentan con count().
        # para mostrar resultados, se tiene que recibir como mínimo 1 fila
        $allRows = $result -> fetchAll();
        if(count($allRows) < 1) {
            echo "<h3>No se han encontrado más anuncios para esta categoría.</h3>";
        } else {
            $result -> execute();

            echo "<div class='postgrid'>";

            foreach ($result as $post) {

                echo "<article>
                    <h2><a href='anuncio.php?id=$post[id]'>$post[titulo]</a></h2>
                    <h2>$post[nombreCategoria]</h2>
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

<?php
    require_once("conexion_pdo.php");
    $db = new Conexion();
    
    # en estas variables se guarda el useragent y la ip pública del usuario, además de la fecha y hora actuales
    $useragent = $_SERVER['HTTP_USER_AGENT'];
    $ip = $_SERVER['REMOTE_ADDR'];
    $fechahora = date("Y-m-d H:i:s");

    # la consulta inserta una fila en la tabla de visualizaciones con los datos de arriba (y la id del anuncio correspondiente, conseguida por GET)
    $query = $db -> prepare("INSERT INTO P02visualizaciones(ip, fechahora, useragent, anuncio) VALUE ('$ip', '$fechahora', '$useragent', $_GET[id])");
    $query -> execute();

    $db = NULL;
?>

</html>