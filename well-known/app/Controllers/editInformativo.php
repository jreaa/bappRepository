<?php 
session_start();
include('../../vendor/autoload.php');
include('../Informativo/Informativo.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

if(isset($_POST['btn'])){
    

	$fecha_inductivo = $_POST['fecha_inductivo'];
	$hora_inductivo = $_POST['hora_inductivo'];
	$id_postulante = $_POST['cc'];
	$id = $_POST['id'];

	try{
	    
	    $inductivo = new Informativo;
	    $inductivo->edit($id_postulante, $fecha_inductivo, $hora_inductivo,$id);
	    
	    $_SESSION['c'] = "Usted ha editado una induccion";
        header("Location: ../../../informativo.php");
	    

	}catch(PDOException $e){
		echo $e;
	}
	

}else{
    header("Location: ../../../informativo.php");
}