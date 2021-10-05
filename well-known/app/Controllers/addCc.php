<?php 
session_start();
include('../../vendor/autoload.php');
include('../CentroCosto/CentroCosto.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

if(isset($_POST['btn'])){
	$cc = strtolower($_POST['cc']);
	$description = strtolower($_POST['description']);
	try{
	    
	    $centroCosto = new CentroCosto;
	    $centroCosto->addCc($cc,$description);
	    
	    $_SESSION['c'] = "Usted ha agreado un nuevo centro de costo";
        header("Location: ../../../centro_costo.php");
	    

	}catch(PDOException $e){
		echo $e;
	}
	

}else{
    header("Location: ../../../centro_costo.php");
}