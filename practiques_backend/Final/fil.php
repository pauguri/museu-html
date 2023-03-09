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
    <header style="display: flex; justify-content: space-between;">
        <a href="index.php"><button>Torna a l'inici</button></a>
		
        <!-- Formulari de cerca -->
        <form action="resultatscerca.php" method="get">
			<label for="cerca">Cerca missatges: </label>
			<input type="text" id="cerca" name="cerca" required>
			<button type="submit">Cerca</button>
		</form>
	</header>
    
    <?php
        $db = new Conexion();
        $idFil = $_GET["id"];

        // Consulta el títol del fil
        $result = $db -> prepare("SELECT titol FROM f23fils WHERE id=$idFil");
        $result -> execute();
        echo "<h2>Fil: " . $result -> fetchColumn() . "</h2>";

        // Consulta tots els missatges del fil (ordenats per data)
        $result = $db -> prepare("SELECT missatge,moment,autor FROM f23missatges WHERE fil=$idFil ORDER BY moment");
        $result -> execute();
        
        echo "<div class='missatges'>";
        foreach ($result as $missatge) {
            echo "<p class='missatge'>
                <strong>$missatge[autor]</strong></br>
                $missatge[missatge]</br>" . date("d/m/Y \a \l\\e\s H:i", strtotime($missatge["moment"])) . "</p>"; // la data es canvia de format per adaptar-la al nostre estàndar
        }
        echo "</div>";

        $db = null;
    ?>
    <h3>Publica un missatge al fil</h3>
    <form action="insertamissatge.php" method="post">
        <!-- El camp ocult "id" envia la id del fil per POST sense que l'usuari ho sàpiga -->
        <input type="hidden" name="id" value="<?php echo "$idFil" ?>">
        <label for="nom">Nom: </label>
        <input type="text" id="nom" name="nom" maxlength="100" required></br>
        <textarea name="missatge" placeholder="Escriu aquí el teu missatge" style="width: 300px; height: 150px;" required></textarea></br>
        <button type="submit">Publica</button>
    </form>
</body>
</html>