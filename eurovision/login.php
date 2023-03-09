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
        require_once("conexion_pdo.php");
        $db = new Conexion();

        if(isset($_COOKIE["ev_userid"])){
            $result = $db -> prepare("UPDATE ev_users SET name=:username WHERE id=$_COOKIE[ev_userid]");
        } else {
            $result = $db -> prepare("INSERT INTO ev_users (name) VALUE (:username)");
            $result -> execute(array(":username" => $_POST["name"]));
            setcookie("ev_userid", $db -> lastInsertId(), time() + (86400 * 30), "/");
        }

        require_once("checksession.php");
        header("location:userhome.php");

        $db = null;
    ?>
</body>
</html>