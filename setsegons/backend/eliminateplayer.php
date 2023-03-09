<?php
    require_once("dbconnect.php");
    $db = new DB();

    $checked = $_POST["checked"];
    $concursant = $_POST["concursant"];

    if($db->query("UPDATE ss_concursants SET eliminat = '$checked' WHERE id='$concursant'")){
        echo json_encode(array("checked" => $checked, "error" => 0));
    } else {
        echo json_encode(array("error" => 1));
    }

    $db = null;
?>