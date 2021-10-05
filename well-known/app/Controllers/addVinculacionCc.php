<?php 
session_start();
include('../../vendor/autoload.php');
include('../CentroCosto/CentroCosto.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

if(isset($_POST['btn'])){
	$id_postulante = $_POST['id_postulante'];
	$id_cc = $_POST['id_cc'];
	

	try{
	    
	    $centroCosto = new CentroCosto;
	    $centroCosto->addVinculacionCc($id_postulante,$id_cc);
	    
	    $_SESSION['c'] = "Usted ha agreado una nueva clasificacion";
        header("Location: ../../../clasificacion.php");
	    

	}catch(PDOException $e){
		echo $e;
	}
	

}else{
    header("Location: ../../../clasificacion.php");
}