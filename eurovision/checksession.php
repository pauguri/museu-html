<?php

    session_start();

    if(!isset($_COOKIE["ev_userid"])){
        session_destroy();
        header("location:index.php");
        return;
    }
    if(!isset($_SESSION["name"])){
        require_once("conexion_pdo.php");
        $db = new Conexion();

        $result = $db -> prepare("SELECT name FROM ev_users WHERE id=$_COOKIE[ev_userid]");
        $result -> execute();
        $name = $result -> fetchColumn();

        $_SESSION["name"] = $name;
    }

    
?>