<?php 

include('../Monestacion/Monestacion.php');

$postulante = $_POST['postulante'];
$formato = $_POST['formato'];
$mensaje = $_POST['mensaje'];



try{
	$monestacion = new Monestacion;
	$monestacion->addMonestacion($postulante,$formato,$mensaje);
}catch(PDOException $e){
	echo $e;
}

header('Location: ../../monestacion.php');
