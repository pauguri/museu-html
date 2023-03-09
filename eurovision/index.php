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
        if(isset($_COOKIE["ev_userid"])){
            header("location:login.php");
        }
    ?>

    <form method="post" action="login.php">
        <input type="text" required maxlength="50" placeholder="NAME" name="name">
        <input type="submit" value="LOG IN">
    </form>
</body>
</html>