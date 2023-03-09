<body>
<?php
    require_once("dbconnect.php");
    $db = new DB();

    $result = $db->query("SELECT COUNT(*) FROM ss_concursants WHERE programa=$_POST[id]");
    $contestantCount = $result -> fetchColumn();
    $queryCount = 0;

    for($i = 1; $i <= $contestantCount; $i++){
        echo "$_POST[$i]";
        $result = $db->prepare("UPDATE ss_concursants SET nom=:nom WHERE programa=$_POST[id] AND ordre=$i");
        if($result -> execute(array(":nom" => $_POST[$i]))){ 
            $queryCount++;
        }
    }

    if($queryCount != $contestantCount){
        echo "Error guardant els noms dels concursants.";
        return;
    }

    $db = null;

    if(isset($_POST['redirect'])){
        header("location:../index.php?id=$_POST[id]");
    } else {
        header("location:../setupshow.php?id=$_POST[id]");
    }
?>
</body>