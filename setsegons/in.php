<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="./js/jquery-3.6.3.min.js"></script>
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
    <div id="total-container" class="small">
        <?php
            $result = $db -> query("SELECT id,nom,punts,eliminat FROM ss_concursants WHERE programa=$_GET[id] ORDER BY ordre");

            foreach ($result as $concursant) {
                
                echo "<div class='small total". ($concursant['eliminat'] == 1 ? " eliminated" : "") ."'>
                    <div class='small total-name'>$concursant[nom]</div>
                    <div class='small total-points' id='$concursant[id]'>$concursant[punts]</div>
                </div>";
            }
        ?>
    </div>
    <?php
        $proves = $db -> query("SELECT id,nom,agrupable FROM ss_proves ORDER BY id");
        foreach ($proves as $prova) {

            echo "<div class='prova'>
                <h2 class='underlined'>$prova[nom]</h2>";

            $concursants = $db -> query("SELECT id,nom,bloquejat,ss_puntsxprova.punts AS puntsProva FROM ss_concursants,ss_puntsxprova WHERE ss_puntsxprova.concursant=ss_concursants.id AND programa=$_GET[id] AND prova=$prova[id] ORDER BY ordre");
            foreach ($concursants as $concursant) {

                echo "<div class='concursant". ($concursant['bloquejat'] == 1 ? " locked" : "") ."'>
                    <h4><button class='lock-points' data-concursant='$concursant[id]' data-prova='$prova[id]'><i class='fas fa-cloud-upload-alt'></i></button>$concursant[nom]&emsp;<i class='fas fa-caret-right'></i>&emsp;<span class='current-points'>$concursant[puntsProva]</span></h4>";

                $valors = $db -> query(("SELECT valor,hint FROM ss_ponderacions WHERE prova=$prova[id]"));
                foreach ($valors as $valor) {
                    echo "<button class='update-points' data-concursant='$concursant[id]' data-prova='$prova[id]' data-value='" . (-$valor['valor']) . "'>" . (-$valor['valor']) . "</button>&ensp;$valor[hint]&ensp;<button class='update-points' data-concursant='$concursant[id]' data-prova='$prova[id]' data-value='" . ($valor['valor']) . "'>" . ($valor['valor']) . "</button></br>";
                }
                echo "</div>";
            }

            echo "</div>";
        }
    ?>

    <h2 class="underlined red">Eliminació</h2>
    <?php
        $concursants = $db -> query("SELECT id,nom,punts,eliminat FROM ss_concursants WHERE programa=$_GET[id] ORDER BY punts");
        foreach ($concursants as $concursant) {

            echo "<div class='concursant'>
                <h4>$concursant[nom]&emsp;<i class='fas fa-caret-right'></i>&emsp;<span class='current-points'>$concursant[punts]</span></h4>
                <input type='checkbox' class='eliminate-box' data-concursant='$concursant[id]'". ($concursant['eliminat'] == 1 ? " checked" : "") .">&ensp;<span class='red'>Eliminar</span>";
            echo "</div>";
        }

        $db = null;
    ?>

    <div class="spacer"></div>

    <script>
        $(document).ready(function() {

            $(".update-points").click(function(e) {
                let concursant = $(this).data("concursant");
                let prova = $(this).data("prova");
                let value = $(this).data("value");
                $.ajax({
                    type: "POST",
                    url: "./backend/updatepoints.php",
                    data: {concursant: concursant, prova: prova, punts: value},
                    dataType: "JSON",
                    success: function(response){
                        if(response.error == 0){
                            $(e.target).siblings("h4").children(".current-points").html(response.points);
                        } else {
                            alert("ERROR");
                        }
                    }
                })
            });

            $(".lock-points").click(function(e) {
                let concursant = $(this).data("concursant");
                let prova = $(this).data("prova");
                $.ajax({
                    type: "POST",
                    url: "./backend/submitpoints.php",
                    data: {concursant: concursant, prova: prova},
                    dataType: "JSON",
                    success: function(response){
                        if(response.error == 0){
                            if(response.points >= 0){
                                $(".total-points#" + response.concursant).html(response.points);
                            }
                            if(response.locked == 0){
                                $(e.target).parents(".concursant").removeClass("locked");
                            } else {
                                $(e.target).parents(".concursant").addClass("locked");
                            }
                        } else {
                            alert("ERROR");
                        }
                    }
                })
            });

            $(".eliminate-box").change(function(e) {
                let checked = this.checked ? 1 : 0;
                let concursant = $(this).data("concursant");
                console.log(checked);
                $.ajax({
                    type: "POST",
                    url: "./backend/eliminateplayer.php",
                    data: {checked: checked, concursant: concursant},
                    dataType: "JSON",
                    success: function(response){
                        if(response.error == 0){
                            $(e.target).attr("checked",response.checked);
                            if(response.checked == 1){
                                $(".total-points#" + concursant).parents(".total").addClass("eliminated");
                            } else {
                                $(".total-points#" + concursant).parents(".total").removeClass("eliminated");
                            }
                        } else {
                            alert("ERROR");
                        }
                    }
                })
            })

        })
    </script>
</body>
</html>