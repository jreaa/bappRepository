<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
include('../Control_Hora/Control_Hora.php');
session_start();

use Illuminate\Database\Capsule\Manager as DB;

$requerimiento = $_POST['requerimiento'];
$postulante = $_POST['postulante'];
$date = $_POST['date'];
$hours = $_POST['hours'];
$name = $_POST['name'];
$rut = $_POST['rut'];


try{
	$control_hora = new Control_Hora;
	$control_hora->addControl($requerimiento,$date,$hours, $name,$rut,$postulante);
    $_SESSION['c'] = "Usted ha agreado un nuevo control de hora satisfactoriamente";
}catch(PDOException $e){
	echo $e;
}
header('Location: ../../control_hora.php');