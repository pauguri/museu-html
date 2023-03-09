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
    <header>SET Segons</header>
    <form id="main-form" action="in.php" method="GET">
        <label for="programa">Programa: </label>
        <select name="id" id="programa">
            <?php
                $db = new DB();

                $getId = "";
                if(isset($_GET['id'])){
                    $getId = $_GET['id'];
                }

                $result = $db->query("SELECT * FROM ss_programes WHERE visible=1");

                foreach ($result as $programa) {
                    echo "<option". ($getId == $programa['id'] ? " selected" : "") ." value='$programa[id]'>$programa[nom] (". date("d/m/Y H\h",strtotime($programa['data'])) .")</option>";
                }

                $db = null;
            ?>
        </select> <a href="addshow.php"><button type="button"><i class="fas fa-plus"></i> Nou programa</button></a></br>
        <button type="submit" formaction="setupshow.php"><i class="fas fa-users-cog"></i> Configurar programa</button></br>
        <button type="submit"><i class="fas fa-edit"></i> Editar puntuacions</button></br>
        <button type="submit" formaction="view.php"><i class="fas fa-video"></i> Visualitzar puntuacions totals (OBS)</button></br>
        <button type="submit" formaction="out.php"><i class="fas fa-eye"></i> Visualitzar puntuacions detallades</button>
        
    </form>
</body>
</html>