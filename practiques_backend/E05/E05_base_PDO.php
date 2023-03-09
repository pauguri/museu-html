<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Exercici E05</title>
<link href="estils.css" rel="stylesheet">
</head>
<body>
<?PHP
//1- Obrir connexió a MAriaDB amb l'extensió PDO
require_once("conexion_pdo.php");
$db = new Conexion();

//2- Dissenyar i executar consulta SQL
$consulta = "SELECT * FROM s7noticias";
$result = $db -> prepare($consulta);
$result -> execute();

$fecha = date ("d/n/Y H:i:s");
echo ("<h1>Centre de la Imatge i la Tecnologia Multimedia</h1>\n");
echo ("<h4>$fecha</h4>\n");

//3- Recorrer el resultat de la consulta rebut i fer output

echo "<section class=\"flex-container\">\n";
foreach ($result as $value){
	echo "<article>\n";
	echo "<h2><a href=\"$value[link]\">$value[titulo]</a></h2>\n";
	echo "<date>$value[fecha]</date>\n";
	echo "<h3>". ((strlen($value['resumen'])>200) ? substr($value['resumen'],0,200)."..." : $value['resumen']) . "</h3>";
	echo "<img src=\"$value[imagen]\">\n\n";
	echo "</article>\n";
}
echo "</section>\n";

//4- Tancar connexió PDO
$db = NULL;

?>

</body>
</html>