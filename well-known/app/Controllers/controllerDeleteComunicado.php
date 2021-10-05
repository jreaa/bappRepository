<?php 

include('../Comunicados/Comunicados.php');

$postulante = $_POST['postulante'];
$formato = $_POST['formato'];
$mensaje = $_POST['mensaje'];


$id = $_GET['id'];
try{
	$comunicados = new Comunicados;
	$comunicados->deleteComunicado($id);
}catch(PDOException $e){
	echo $e;
}

header('Location: ../../comunicado.php');
