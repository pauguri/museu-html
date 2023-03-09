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
            echo "<strong>$titol</strong>";
        ?>
    </header>
    <div id="total-container">
        <?php
            $result = $db -> query("SELECT id,nom,punts,eliminat FROM ss_concursants WHERE programa=$_GET[id] ORDER BY ordre");

            foreach ($result as $concursant) {
                
                echo "<div class='total". ($concursant['eliminat'] == 1 ? " eliminated" : "") ."'>
                    <div class='total-name'>$concursant[nom]</div>
                    <div class='total-points' id='$concursant[id]'>$concursant[punts]</div>
                </div>";
            }
        ?>
    </div>
    <h2>Puntuació per prova</h2>
    <div id="table-container">
        <table>
            <tr>
                <th>Concursant</th>
                <?php
                    $result = $db -> query("SELECT nom FROM ss_proves");
                    foreach ($result as $prova) {
                        echo "<th>$prova[nom]</th>";
                    }
                ?>
                <th>TOTAL</th>
            </tr>
            <?php
                $result = $db -> query("SELECT id,nom,punts,eliminat FROM ss_concursants WHERE programa='$_GET[id]' ORDER BY ordre");
                foreach ($result as $concursant) {
                    echo "<tr>
                        <td>$concursant[nom]</td>";
                    
                    $result = $db -> query("SELECT punts,bloquejat FROM ss_puntsxprova WHERE concursant='$concursant[id]'");
                    $subtotal = 0;
                    foreach ($result as $prova) {
                        $subtotal += $prova['punts'];
                        echo "<td ". ($prova['bloquejat'] == 1 ? "class='confirmed'" : "") ."><strong>$prova[punts]</strong> ($subtotal)</td>";
                    }

                    echo "<td><strong>$concursant[punts]</strong></td>
                    </tr>";
                }
            ?>
        </table>
    </div>
</body>
</html>