<?php
require_once("conexion_pdo.php");
    $db = new Conexion();

    $email = $_POST['email'];
    $passwd = $_POST['pass'];

    $result = $db -> prepare("SELECT * FROM e06usuaris WHERE email=:email AND password=:pass");
    $result -> execute(array(":email" => $email, ":pass" => $passwd));
    $resultArray = $result -> fetchAll();
    if(count($resultArray) == 1){
        session_start();
        $result -> execute(array(":email" => $email, ":pass" => $passwd));
        $userdata = $result -> fetch();
        $_SESSION["userid"] = $userdata['iduser'];

        header("location:index.php");
    } else {
        header("location:login.php");
    }
?>