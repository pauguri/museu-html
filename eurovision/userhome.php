<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/16854bd097.js" crossorigin="anonymous"></script>
    <title>Eurovision Scoreboard</title>
</head>
<body>
    <?php
        require_once("conexion_pdo.php");
        require_once("checksession.php");
        include("header.php");
        $db = new Conexion();
    ?>

    <main>
        
        <?php
            $result = $db -> prepare("SELECT year,city,country,ev_users.name AS owner, ev_rooms.id AS code FROM ev_rooms,ev_contests,ev_users,ev_joined_rooms WHERE ev_joined_rooms.user=$_COOKIE[ev_userid] AND ev_joined_rooms.room=ev_rooms.id AND ev_rooms.owner=ev_users.id AND ev_rooms.contest=ev_contests.year");
            $result -> execute();

            $roomCount = count($result -> fetchAll());
            if($roomCount > 0){
                echo "<h2>Joined Rooms</h2>
                    <div id='room-list'>";
                
                $result -> execute();
                foreach ($result as $rooms) {
                    echo "<a class='room hoverable' href='room.php?code=$rooms[code]' style='background-image:url(img/countries/$rooms[country].svg)'>
                    <div class='room-title'>$rooms[city] $rooms[year]</div>
                        <div class='room-owner'>Created by: <strong>$rooms[owner]</strong></div>
                        <div class='room-code'><i class='fas fa-key'></i> " . strtoupper($rooms["code"]) . "</div>
                    </a>";
                }
                echo "</div>";
            }
        ?>
        
        <form method="get" action="room.php">
            <input id="code-input" type="text" minlength="4" maxlength="4" placeholder="ROOM CODE" name="code">
            <?php
                if(isset($_GET["e"])){
                    if($_GET["e"] == 1){
                        echo "<p class='error'>Room not found.</p>";
                    }
                }
            ?>
            <input type="submit" class="hoverable" value="JOIN ROOM">
        </form>

        <form action="createroom.php" method="post">
            <select name="contest">
                <?php

                    $result = $db->query("SELECT * FROM ev_contests ORDER BY year DESC");
                    foreach ($result as $contest) {
                        echo "<option value='$contest[year]'>$contest[city] $contest[year]</option>";
                    }

                    $db = null;
                ?>
            </select>
            <?php
                if(isset($_GET["e"])){
                    if($_GET["e"] == 2){
                        echo "<p class='error'>Error creating room. Please try again.</p>";
                    }
                }
            ?>
            <input type="submit" class="hoverable" value="CREATE ROOM">
        </form>
    </main>

    <script>
        const codeInput = document.getElementById("code-input");
        codeInput.addEventListener("input", (e) => {
            codeInput.value = codeInput.value.toUpperCase();
        });
    </script>
</body>
</html>