<body>
<?php
    require_once("dbconnect.php");
    $db = new DB();

    $idprograma = $_POST['id'];
    
    $result = $db -> query("SELECT id FROM ss_concursants WHERE programa = '$idprograma'");
    foreach ($result as $concursants) {
        if(!$db -> query("DELETE FROM ss_puntsxprova WHERE concursant=$concursants[id]")){
            echo "Error eliminant el programa.";
            return;
        }
    }

    if(!$db -> query("DELETE FROM ss_concursants WHERE programa = '$idprograma'; DELETE FROM ss_programes WHERE id = '$idprograma'")){
        echo "Error eliminant el programa.";
        return;
    }

    $db = null;

    header("location:../index.php");
?>
</body>