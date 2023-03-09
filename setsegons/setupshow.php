<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/16854bd097.js" crossorigin="anonymous"></script>
    <title>Puntuació SET Segons</title>
</head>
<?php require_once("./backend/dbconnect.php"); ?>
<body>
    <header>
        <a class="home-button" href="index.php?id=<?php echo $_GET["id"] ?>"><i class="fas fa-home"></i></a>
        <?php
            $db = new DB();

            $result = $db->query("SELECT nom FROM ss_programes WHERE id=$_GET[id]");
            $titol = $result -> fetchColumn();
            echo "Configuració del programa: <strong>$titol</strong>";
        ?>
    </header>

    <form action="./backend/applysetup.php" method="post">
        <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
        <h3 id="contestants-title">Editar concursants</h3>
        <?php
            $result = $db->query("SELECT nom FROM ss_concursants WHERE programa=$_GET[id] ORDER BY ordre");

            foreach ($result as $i => $concursant) {
                echo "<input type='text' name='". ($i + 1) ."' placeholder='Nom del concursant ". ($i + 1) ."' value='$concursant[nom]'></br>";
            }
        ?>
        <button type="submit"><i class="fas fa-save"></i> Desa</button>
        <button type="submit" name="redirect"><i class="fas fa-save"></i> Desa i torna</button>
    </form>
    <form action="./backend/deleteshow.php" method="post" onsubmit="return confirm('Estàs a punt d\'eliminar el programa: <?php echo $titol ?>.\nSegur que vols continuar? Aquesta acció no es pot desfer.');">
        <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
        <button type="submit" style="color: darkred;"><i class="fas fa-trash-alt"></i> Eliminar programa</button>
    </form>
</body>
</html>