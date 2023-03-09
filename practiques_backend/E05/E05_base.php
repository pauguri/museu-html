<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Exercici E05</title>
<link href="estils.css" rel="stylesheet">
</head>

<body>
<?PHP
//Definició array 
$a= array("Kai Caire, Elena Fernández i Aamna Noor Syed guanyen la Beca CITM a l’Excel·lència Acadèmica", "https://www.citm.upc.edu/blog/wp-content/uploads/2022/10/GuanyadorsBeca-5.jpg", "https://www.citm.upc.edu/blog/kai-caire-elena-fernandez-i-aamna-noor-syed-guanyadors-de-la-beca-citm-a-lexcel%c2%b7lencia-academica/?lang=ca", "26-10-2022", "Kai Caire, Elena Fernández i Aamna Noor Syed són els tres joves estudiants que han rebut la beca CITM a l’excel·lència acadèmica per iniciar els seus estudis al Centre de la Imatge i la Tecnologia Multimèdia aquest curs 2022-2023. Kai Caire Castellsegué comença el grau en Disseny i Desenvolupament de Videojocs a Barcelona, Elena Fernández León el grau en Multimèdia i Aamna Noor Syed Shahzadi inicia el grau en Disseny, Animació i Art Digital.");
$b= array("Eva Villegas i Maria Pagès, noves professores PDI del CITM", "https://www.citm.upc.edu/blog/wp-content/uploads/2022/10/ProfessoresCITM-2048x1323.jpg", "https://www.citm.upc.edu/blog/eva-villegas-i-maria-pages-noves-professores-pdi-del-citm/?lang=ca", "24-10-2022", "El Centre de la Imatge i la Tecnologia Multimèdia continua treballant per incorporar cada nou curs el millor talent al seu equip docent. Aquest curs acadèmic 2022-2023, Eva Villegas i Maria Pagès són les noves professores que s’integren a l’equip de Personal Docent i Investigador (PDI) per donar una nova empenta a les àrees de coordinació acadèmica i de recerca del Centre.");
$c= array("La professora Carolina López, comissària del festival internacional ANIMARIO 2022", "https://www.citm.upc.edu/blog/wp-content/uploads/2022/10/Animario-1.jpg", "https://www.citm.upc.edu/blog/la-professora-carolina-lopez-comissaria-del-festival-internacional-animario-2022/?lang=ca", "20-10-2022", "Carolina López és professora i investigadora del CITM, a més d’una de les especialistes més respectades del món de l’animació. Des de la seva creació, fa 5 anys, és la comissària d’ANIMARIO, el Festival Internacional d’Animació Contemporània de Madrid, que se celebrarà del 20 al 23 d’octubre al centre cultural Matadero Madrid.");
$d= array("Gerard Pasqual apropa els projectes de Marvel als estudiants del CITM", "https://www.citm.upc.edu/blog/wp-content/uploads/2022/10/Pasqual.jpg", "https://www.citm.upc.edu/blog/gerard-pasqual-apropa-els-projectes-de-marvel-als-estudiants-del-citm-2/?lang=ca", "6-10-2022", "El 3 d’octubre, els estudiants de l’assignatura Animació Avançada van tenir el plaer d’assistir a una ponència de Gerard Pasqual Gill, creature FX a Trixter.");

$m= array($a, $b, $c, $d); 

//Contineu l'exercici aqui
echo "<h1>Centre de la Imatge i la Tecnologia Multimèdia</h1>\n<time>".date("d-m-Y / H:i:s")."</time>";

echo "<section class=\"flex-container\">\n";

foreach($m as $noti){
    echo "<article>\n
    <h2><a href=\"$noti[2]\">$noti[0]</a></h2>\n
    <time>$noti[3]</time>\n
    <h3>" . (strlen($noti[4]) > 200 ? substr($noti[4], 0, 200) . "..." : $noti[4]) . "</h3>\n
    <img src=\"$noti[1]\"/>\n
    </article>";
}

echo "</section>\n";



?>

</body>
</html>