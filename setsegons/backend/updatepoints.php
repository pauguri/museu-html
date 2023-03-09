<?php
    require_once("dbconnect.php");
    $db = new DB();

    $concursant = $_POST['concursant'];
    $prova = $_POST['prova'];
    $punts = $_POST['punts'];

    $result = $db -> query("SELECT punts FROM ss_puntsxprova WHERE concursant = '$concursant' AND prova = '$prova'");
    $currentPoints = $result -> fetchColumn();

    $newPoints = $currentPoints + $punts;

    if($db -> query("UPDATE ss_puntsxprova SET punts=$newPoints WHERE concursant = '$concursant' AND prova = '$prova'")){
        echo json_encode(array("points" => $newPoints, "error" => 0));
    } else {
        echo json_encode(array("error" => 1));
    }

    $db = null;
?>