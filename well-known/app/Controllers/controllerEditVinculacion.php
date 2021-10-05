<?php 

session_start();
include('../../vendor/autoload.php');
include('../Vinculacion/Vinculacion.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

if(isset($_POST['btn'])){
	$id_vehiculo = $_POST['id_vehiculo'];
	$id_postulante = $_POST['id_postulante'];

    $id = $_POST['id'];
    
	try{
	    
	    $v = new Vinculacion;
	    $v->editVinculacion($id_vehiculo,$id_postulante,$id);
	    $_SESSION['v'] = "Usted ha editado una vinculacion satisfactoriamente";
        header("Location: ../../../vinculacion.php");
	    
        
	}catch(PDOException $e){
		echo $e;
	}
	

}else{
    header("Location: ../../../vinculacion.php");
}