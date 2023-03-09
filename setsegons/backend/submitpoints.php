<?php
    require_once("dbconnect.php");
    $db = new DB();

    $concursant = $_POST['concursant'];
    $prova = $_POST['prova'];
    $error = 0;

    $result = $db->query("SELECT bloquejat FROM ss_puntsxprova WHERE concursant = '$concursant' AND prova = '$prova'");
    $locked = $result->fetchColumn();

    if($locked == 0){
        $newPoints = 0;

        $result = $db -> query("SELECT punts FROM ss_puntsxprova WHERE concursant = '$concursant'");
        foreach ($result as $punts) {
            $newPoints += $punts['punts'];
        }

        if(!$db -> query("UPDATE ss_concursants SET punts=$newPoints WHERE id = '$concursant'")){
            $error++;
        };
    } else {
        $newPoints = -1;
    }

    $newLocked = $locked == 1 ? 0 : 1;
    if(!$db -> query("UPDATE ss_puntsxprova SET bloquejat=$newLocked WHERE concursant = '$concursant' AND prova = '$prova'")){
        $error++;
    }

    echo json_encode(array("concursant" => $concursant, "points" => $newPoints, "locked" => $newLocked, "error" => $error));

    $db = null;
?>