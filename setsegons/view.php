<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="view.css">
    <title>Puntuació SET Segons</title>
</head>
<?php require_once("./backend/dbconnect.php"); ?>
<body>
    <div id="view-container">
        <?php
            $db = new DB();

            $result = $db -> query("SELECT id,nom,punts,eliminat FROM ss_concursants WHERE programa=$_GET[id] ORDER BY punts DESC");

            foreach ($result as $concursant) {
                
                echo "<div class='view-total". ($concursant['eliminat'] == 1 ? " eliminated" : "") ."'>
                    <div class='view-total-name'>$concursant[nom]</div>
                    <div class='view-total-points' id='$concursant[id]'>$concursant[punts]</div>
                </div>";
            }
        ?>
    </div>
</body>
</html>