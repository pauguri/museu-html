<?php include("header.php"); ?>

    <?php
        require_once("conexion_pdo.php");
        $db = new Conexion();

        $result = $db -> query("SELECT id,nom,preu FROM s14productes");
    
        echo "<ul>";
        foreach ($result as $product) {
            echo "<li><a href='product.php?id=$product[id]'>$product[nom]</a></br>$product[preu]</li>";
        }
        echo "</ul>";

        $db = null;
    ?>
</body>
</html>