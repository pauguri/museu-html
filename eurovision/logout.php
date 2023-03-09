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

        $result1 = $db->query("DELETE FROM ev_joined_rooms WHERE user=$_COOKIE[ev_userid]");
        $result1 -> execute();

        $result2 = $db->query("DELETE FROM ev_votes WHERE user=$_COOKIE[ev_userid]");
        $result2 -> execute();

        $result3 = $db->query("DELETE FROM ev_rooms WHERE owner=$_COOKIE[ev_userid]");
        $result3 -> execute();

        $result4 = $db->query("DELETE FROM ev_users WHERE id=$_COOKIE[ev_userid]");
        $result4 -> execute();

        $db = null;

        session_destroy();
        setcookie("ev_userid", "", time() - 3600, "/");
        header("location:index.php");

    ?>
</body>
</html>
