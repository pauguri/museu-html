<?php
    require_once("conexion_pdo.php");
    $db = new Conexion();
    
    $room = $_POST['room'];
    $user = $_POST['user'];
    $country = $_POST['country'];
    $points = $_POST['points'];

    $result = $db -> prepare("SELECT COUNT(*) FROM ev_votes WHERE room='$room' AND user='$user' AND country='$country'");
    $result -> execute();
    if($result -> fetchColumn() == 1){
        $result = $db->prepare("UPDATE ev_votes SET points='$points' WHERE room='$room' AND user='$user' AND country='$country'");
    } else {
        $result = $db->prepare("INSERT INTO ev_votes(room,user,country,points) VALUES ('$room', '$user', '$country', '$points')");
    }
    
    if($result -> execute()){
        $db = null;
        echo json_encode(array("isSuccess" => 1));
    } else {
        $db = null;
        echo json_encode(array("isSuccess" => 0));
    }
?>