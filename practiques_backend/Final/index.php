<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>Fòrum de cuina – Examen final</title>
</head>
	<?PHP
	require_once("conexion_pdo.php");
	?>
<body>
	<header style="text-align: right;">

		<!-- Formulari de cerca -->
		<form action="resultatscerca.php" method="get">
			<label for="cerca">Cerca missatges: </label>
			<input type="text" id="cerca" name="cerca" required>
			<button type="submit">Cerca</button>
		</form>
	</header>
	<h1>Fòrum de cuina – Examen final</h1>
	<?PHP

	$db = new Conexion();

	$dbTabla='f23fils';

	// En tres líneas 
	$consulta = "SELECT * FROM $dbTabla order by data desc"; 
	$result = $db->prepare($consulta); 
	$result->execute();

	//Processament + output
	if (!$result){ 
		print "<p> Error en la consulta. </p>\n";
	}else{ 
		foreach( $result as $valor){
			print "<p><a href=\"fil.php?id=$valor[id]\">$valor[titol] ($valor[data])</a></p>\n";
		} 
	}
	//Fi Processament

	//Tanquem connexió
	$db=NULL;
	?>
</body>
</html>