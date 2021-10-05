<?php 
session_start();
include('../../vendor/autoload.php');
include('../CentroCosto/CentroCosto.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

if(isset($_POST['btn'])){
	$cc = strtolower($_POST['cc']);
	$description = strtolower($_POST['description']);
	$id = $_POST['id'];
	
	try{
	    
	    $centroCosto = new CentroCosto;
	    $centroCosto->updateCc($cc,$description, $id);
	    
	    $_SESSION['c'] = "Usted ha actualizado un centro de costo";
        header("Location: ../../../centro_costo.php");
	    

	}catch(PDOException $e){
		echo $e;
	}
	

}else{
    header("Location: ../../../centro_costo.php");
}