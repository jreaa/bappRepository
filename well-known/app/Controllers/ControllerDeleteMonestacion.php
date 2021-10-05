<?php 

include('../Monestacion/Monestacion.php');

$postulante = $_POST['postulante'];
$formato = $_POST['formato'];
$mensaje = $_POST['mensaje'];


$id = $_GET['id'];
try{
	$monestacion = new Monestacion;
	$monestacion->deleteMonestacion($id);
}catch(PDOException $e){
	echo $e;
}

header('Location: ../../monestacion.php');
