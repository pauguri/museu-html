<body>
<?php
    require_once("dbconnect.php");
    $db = new DB();

    $titol = $_POST['titol'];
    $data = $_POST['date'] . " " . $_POST['time'];

    $result = $db->prepare("INSERT INTO ss_programes(nom,data) VALUES (:titol,:data)");
    if(!$result -> execute(array(":titol" => $titol, ":data" => $data))){
        echo "Error creant el programa.";
        return;
    }

    $idprograma = $db -> lastInsertId();
    $concursants = [];

    for ($i=1; $i <= 4; $i++) { 
        $result = $db->prepare("INSERT INTO ss_concursants(nom,programa,ordre) VALUES (:nom, $idprograma, $i)");
        if(!$result -> execute(array(":nom" => $_POST["c" . $i]))){
            echo "Error creant el programa.";
            return;
        } else {
            array_push($concursants, $db -> lastInsertId());
        }
    }

    $insertQuery = "INSERT INTO ss_puntsxprova(concursant,prova) VALUES ";
    $result = $db -> query("SELECT id FROM ss_proves");
    foreach ($result as $prova) {
        foreach ($concursants as $concursant) {
            $insertQuery .= "($concursant, $prova[id]),";
        }
    }
    $insertQuery = rtrim($insertQuery,",");

    if(!$db -> query($insertQuery)){
        echo "Error creant el programa.";
        return;
    }

    $db = null;

    header("location:../index.php?id=$idprograma");
?>
</body>