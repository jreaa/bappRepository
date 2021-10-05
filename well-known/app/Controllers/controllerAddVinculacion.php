<?php 
session_start();
include('../../vendor/autoload.php');
include('../Vinculacion/Vinculacion.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

if(isset($_POST['btn'])){
	$id_vehiculo = $_POST['id_vehiculo'];
	$id_postulante = $_POST['id_postulante'];

	try{
	    
	    $v = new Vinculacion;
	    $v->addVinculacion($id_vehiculo,$id_postulante);
	    $_SESSION['v'] = "Usted ha agreado una nueva vinculacion satisfactoriamente";
        header("Location: ../../../vinculacion.php");
	    
        
	}catch(PDOException $e){
	    echo $e;
        //header("Location: ../../../vinculacion.php");
	}
	

}else{
    header("Location: ../../../vinculacion.php");
}