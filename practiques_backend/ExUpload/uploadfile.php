<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subir Archivos</title>
</head>
<body>
    <?php
        if($_FILES["file"]["size"] > 1572864){
            echo "<h2>Error al subir el archivo (Archivo supera 1.5Mb)</h2>";
        } else {

            if($_FILES["file"]["error"] != 0){
                echo "<h2>Error al subir el archivo (Código: " . $_FILES["file"]["error"] . ")</h2>";
            } else {
                $path_parts = pathinfo($_FILES["file"]["name"]);
                $extension = $path_parts["extension"];

                $newname = "upload/" . date("YmdHis") . "." . $extension;
                $i = 0;
                while(file_exists($newname)){
                    $i++;
                    $newname = "upload/" . date("YmdHis") . "-" . $i . "." . $extension;
                }

                if(move_uploaded_file($_FILES["file"]["tmp_name"],$newname)){
                    require_once("conexion_pdo.php");
                    $db = new Conexion();
                    
                    $nombre = $newname;
                    $tamano = $_FILES["file"]["size"];
                    $mime = $_FILES["file"]["type"];
                    $fechahora = date("Y-m-d H:i:s");
                    $descripcion = $_POST["desc"];
                    $email = $_POST["email"];

                    $consulta = "INSERT INTO s13archivos(nombre, tamano, mime, fechahora, descripcion, email) VALUE (:nombre, $tamano, :mime, '$fechahora', :desc, :email)";
                    $result = $db -> prepare($consulta);
                    if($result -> execute(array(":nombre" => $nombre, ":mime" => $mime, ":desc" => $descripcion, ":email" => $email))){
                        echo "<h2>Imagen subida correctamente</h2>";
                    } else {
                        echo "<h2>Error al subir el archivo (No se puede añadir a BBDD)</h2>";
                    }

                    $db = null;

                } else {
                    echo "<h2>Error inesperado al subir el archivo (No se puede mover a upload)</h2>";
                }
            }
        }
    ?>
</body>
</html>