<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eurovision Scoreboard</title>
</head>
<body> 
    <?php
        require_once("checksession.php");
        require_once("conexion_pdo.php");
        $db = new Conexion();

        // CHECK IF ROOM EXISTS

        $code = strtolower($_POST["code"]);

        $result = $db->prepare("SELECT COUNT(*) FROM ev_rooms WHERE id='$code'");
        $result->execute();

        if($result->fetchColumn() == 0){
            header("location:userhome.php?e=1");
            return;
        }

        // JOIN ROOM

        $result = $db -> prepare("INSERT INTO ev_joined_rooms(user,room) VALUE ($_COOKIE[ev_userid], '$_POST[code]')");
        if($result -> execute()){ 
            header("location:room.php?code=$_POST[code]");
        } else {
            header("location:userhome.php?e=1");
        }

        $db = null;
    ?>
</body>
</html>