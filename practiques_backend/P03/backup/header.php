<header>
<a href="index.php">Inicio</a>
<?php
    require_once("conexion_pdo.php");
    $db = new Conexion();
    $result = $db -> query("SELECT * FROM P02categorias ORDER BY orden");
    foreach ($result as $category){
        echo "<a href='categoria.php?id=$category[id]'>$category[nombre]</a>";
    }
?>
<a href="nuevoanuncio.php" class="btn">Crear Anuncio</a>
</header>
<main>