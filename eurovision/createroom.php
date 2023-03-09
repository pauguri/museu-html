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

        do{
            $newcode = "";
            for($i = 0; $i < 4; $i++){
                $newcode .= chr(rand(97,122));
            }

            $codecheck = $db -> prepare("SELECT COUNT(*) FROM ev_rooms WHERE id=$newcode");
            $codecheck->execute();
            $codecount = $codecheck->fetchColumn();
        } while($codecount != 0);

        $result = $db -> prepare("INSERT INTO ev_rooms(id,contest,owner) VALUE ('$newcode',$_POST[contest],$_COOKIE[ev_userid])");
        if(!$result -> execute()){
            header("location:userhome.php?e=2");
            return;
        }

        header("location:room.php?code=$newcode");

        $db = null;
    ?>
</body>
</html>