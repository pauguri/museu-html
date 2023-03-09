<!-- Pau Guri Viura - Practica 3 -->

<!-- El header es un menú de navegación que se incluirá al principio de cada página -->

<header>
<a href="index.php">Inicio</a>
<?php
    require_once("conexion_pdo.php");
    $db = new Conexion();

    # la consulta devuelve todas las categorías ordenadas según la columna "orden"
    $result = $db -> query("SELECT * FROM P02categorias ORDER BY orden");
    
    # recorremos cada categoría
    foreach ($result as $category){
        
        # cada elemento <a> tiene un enlace a 'categoria.php' (pasando la id de la categoría por GET)
        echo "<a href='categoria.php?id=$category[id]'>$category[nombre]</a>";
    }
?>
<a href="nuevoanuncio.php" class="btn">Crear Anuncio</a>
</header>
<main>