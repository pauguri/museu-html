<?php 
 class Conexion extends PDO { 
   private $tipo_de_base = 'mysql';
   private $host = 'localhost';
   private $nombre_de_base = 'judithjr'; //Establir com a valor, nom de la base de dades individual de mySQL
   private $usuario = 'judithjr'; //Establir com a valor, nom d'usuari de mySQL
   private $contrasena = 'hMJgkRLw'; //Establir com a valor, password de mySQL
   public function __construct()  {
      //Sobreescribo el m�todo constructor de la clase PDO.
      try{
         parent::__construct($this->tipo_de_base.':host='.$this->host.';dbname='.$this->nombre_de_base, $this->usuario, $this->contrasena, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
      }catch(PDOException $e){
         echo 'Ha surgido un error y no se puede conectar a la base de datos. Detalle: ' . $e->getMessage();
         exit;
      }
   } 
 } 
?>