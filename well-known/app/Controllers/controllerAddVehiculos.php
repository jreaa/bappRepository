<?php 
session_start();
include('../../vendor/autoload.php');
include('../Vehiculo/Vehiculo.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

if(isset($_POST['btn'])){
	$nvehiculo = strtolower($_POST['nvehiculo']);
	$nplaca = strtolower($_POST['nplaca']);
	$modelo = strtolower($_POST['modelo']);
	$marca = strtolower($_POST['marca']);
	$anio = strtolower($_POST['anio']);
	
	$color = strtolower($_POST['color']);

	try{
	    
	    $v = new Vehiculo;
	    $v->addVehiculo($nvehiculo,$nplaca, $modelo,$marca,$color,$anio);
	    $_SESSION['v'] = "Usted ha agreado un nuevo vehiculo satisfactoriamente";
        header("Location: ../../../vehiculos.php");
	    
        
	}catch(PDOException $e){
		$_SESSION['v'] = "Usted ya ha registrado un vehiculo con ese numero de placa";
        header("Location: ../../../vehiculos.php");
	}
	

}else{
    header("Location: ../../../vehiculos.php");
}