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
    $id = $_POST['id'];
	try{
	    
	    $v = new Vehiculo;
	    $v->editVehiculo($nvehiculo,$nplaca,$id, $anio, $marca,$modelo,$color);
	    $_SESSION['v'] = "Usted ha editado el vehiculo  $nvehiculo de plca $nplaca satisfactoriamente";
        header("Location: ../../../vehiculos.php");
	    
        
	}catch(PDOException $e){
		echo $e;
	}
	

}else{
    header("Location: ../../../vehiculos.php");
}