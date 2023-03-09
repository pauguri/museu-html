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
        $db = new Conexion();

        $idFil = $_POST["id"];
        $nom = $_POST["nom"];
        $missatge = $_POST["missatge"];
        $moment = date("Y-m-d H:i:s");

        // Consulta el títol del fil
        $result = $db -> prepare("SELECT titol FROM f23fils WHERE id=$idFil");
        $result -> execute();
        echo "<h2>Fil: " . $result -> fetchColumn() . "</h2>";

        // Consulta per inserir el missatge a la BBDD
        $result = $db -> prepare("INSERT INTO f23missatges(missatge,moment,autor,fil) VALUE (:missatge, '$moment', :autor, $idFil)");
        if($result -> execute(array(":missatge" => $missatge, ":autor" => $nom))){
            echo "<h3>Missatge publicat correctament</h3>
            <p class='missatge'>
                <strong>$nom</strong></br>
                $missatge</br>" . date("d/m/Y \a \l\\e\s H:i", strtotime($moment)) . "</p>
            <a href='fil.php?id=$idFil'><button>Tornar al fil</button></a>"; // la data es canvia de format per adaptar-la al nostre estàndar
        }

        $db = null;
    ?>
</body>
</html>