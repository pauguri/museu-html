<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fòrum de cuina – Examen final</title>
</head>
<?php
    require_once("conexion_pdo.php");
?>
<body>
    <header>
        <a href="index.php"><button>Torna a l'inici</button></a>
	</header>
    <?php
        $expr = $_GET["cerca"];
        echo "<h2>Resultats de cerca: \"$expr\"</h2>";

        $db = new Conexion();

        // Consulta per contar quants missatges contenen l'expressió de cerca
        $result = $db -> prepare("SELECT COUNT(idmsg) FROM f23missatges WHERE MATCH missatge AGAINST (:expr IN BOOLEAN MODE)");
        $result -> execute(array(":expr" => "*$expr*"));
        $resultCount = $result -> fetchColumn();
        if($resultCount <= 0){
            echo "<h3>No hi ha resultats</h3>";
        } else {
            // Operador ternari per adaptar el text a singular si només hi ha 1 resultat
            echo "<h3>" . ($resultCount == 1 ? "S'ha trobat 1 resultat" : "S'han trobat $resultCount resultats") . "</h3>";

            // Consulta tots els missatges que contenen l'expressió de cerca
            $result = $db -> prepare("SELECT missatge,autor,fil AS idfil FROM f23fils,f23missatges WHERE MATCH missatge AGAINST (:expr IN BOOLEAN MODE) AND f23missatges.fil=f23fils.id ORDER BY fil,moment");
            $result -> execute(array(":expr" => "*$expr*"));

            echo "<div class='missatges'>";
            foreach ($result as $missatge) {
                echo "<p class='missatge'>
                <strong>$missatge[autor]</strong></br>
                $missatge[missatge] <a href='fil.php?id=$missatge[idfil]'><button>Anar al fil</button></a>
            </p>";
            }
            echo "</div>";
        }

        $db = null;
    ?>
</body>
</html>