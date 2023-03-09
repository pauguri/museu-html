<?php
    session_start();
    if(!isset($_SESSION["userid"]) || $_SESSION["userid"]<0){
        header("location:login.php");
    }
?>