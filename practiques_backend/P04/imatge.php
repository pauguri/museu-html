<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php
        require_once("conexion_pdo.php");
        $db = new Conexion();

        $result = $db -> prepare("SELECT titulo FROM p0422imagenes WHERE id=$_GET[id]");
        $result -> execute();

        echo "<title>" . $result -> fetchColumn() . "</title>";

        $db = null;
    ?>
</head>
<body>
    <?php
        require_once("conexion_pdo.php");
        $db = new Conexion();

        $result = $db -> prepare("SELECT titulo,descripcion,tipoMIME,tamano,nombrearchivo,nombre FROM p0422imagenes,p0422usuarios WHERE propietario=email AND id=$_GET[id]");
        $result -> execute();
        $data = $result -> fetch();

        $filesize = $data['tamano'];
        $multiplier = 0;
        $sizeSuffixes = array("bytes","Kb","Mb","Gb","Tb");

        while($filesize >= 1024) {
            $multiplier++;
            $filesize/=1024;
        }

        echo "<img src='$data[nombrearchivo]'/>
         <p>Titulo: $data[titulo]</br>
         Descripción: $data[descripcion]</br>
         Tamaño: ". round($filesize,2) ." $sizeSuffixes[$multiplier] </br>
         Tipo MIME: $data[tipoMIME]</br>
         Autor: $data[nombre]</p>";

        $ip = $_SERVER['REMOTE_ADDR'];
        $fechahora = date("Y-m-d H:i:s");
        $result = $db -> prepare("INSERT INTO p0422visualizaciones(ip,fechahora,imagen) VALUE ('$ip','$fechahora',$_GET[id])");
        $result -> execute();

        $db = null;
    ?>
</body>
</html>