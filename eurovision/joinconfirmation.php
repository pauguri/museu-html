<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eurovision Scoreboard</title>
</head>
<body>
    <p>Would you like to join:</p>
    
    <?php
        require_once("checksession.php");
        require_once("conexion_pdo.php");
        $db = new Conexion();

        // CHECK IF ROOM EXISTS

        $code = strtolower($_GET["code"]);

        $result = $db->prepare("SELECT COUNT(*) FROM ev_rooms WHERE id='$code'");
        $result->execute();

        if($result->fetchColumn() == 0){
            header("location:userhome.php?e=1");
            return;
        }

        // ASK IF USER WANTS TO JOIN ROOM

        $result = $db -> prepare("SELECT year,city,country,ev_users.name AS owner, ev_rooms.id AS code FROM ev_rooms,ev_contests,ev_users WHERE ev_rooms.id='$_GET[code]' AND ev_rooms.owner=ev_users.id AND ev_rooms.contest=ev_contests.year");
        $result -> execute();
        $roomInfo = $result -> fetch();

        echo "Room with code: " . strtoupper($_GET["code"]) . "<br>
            Created by: $roomInfo[owner]<br>
            Of contest: $roomInfo[city] $roomInfo[year] ($roomInfo[country])";

        $db = null;
    ?>

    <form action="joinroom.php" method="post">
        <input type="hidden" name="code" value="<?php echo "$_GET[code]"; ?>">
        <input type="submit" value="JOIN ROOM">
    </form>
</body>
</html>