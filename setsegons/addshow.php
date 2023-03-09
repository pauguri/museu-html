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
<body>
    <header><a class="home-button" href="index.php"><i class="fas fa-home"></i></a>Nou programa</header>
    <form action="./backend/createshow.php" method="post">
        <label for="titol">Títol</label>
        <input type="text" id="titol" name="titol" placeholder="Títol del programa" value="SET Segons" required></br>
        <label for="date">Dia de rodatge</label>
        <input type="date" id="date" name="date" value="<?php echo date("Y-m-d"); ?>" required>
        <input type="time" id="time" name="time" value="00:00" required>
        <h3 id="contestants-title">Editar concursants&ensp;<i class="fas fa-angle-down"></i></h3>
        <div class="contestants-drawer" style="display: none;">
            <input type="text" id="c1" name="c1" placeholder="Nom del concursant 1" value="Concursant 1"></br>
            <input type="text" id="c2" name="c2" placeholder="Nom del concursant 2" value="Concursant 2"></br>
            <input type="text" id="c3" name="c3" placeholder="Nom del concursant 3" value="Concursant 3"></br>
            <input type="text" id="c4" name="c4" placeholder="Nom del concursant 4" value="Concursant 4"></br>
        </div>
        <button type="submit"><i class="fas fa-save"></i> Desa i torna</button>
    </form>
    <script>
        $(document).ready(function() {
            $("#contestants-title").click(function() {
                $(this).siblings(".contestants-drawer").slideToggle("fast");
                $(this).children("i").toggleClass("fa-angle-down").toggleClass("fa-angle-up");
            })
        })
    </script>
</body>
</html>