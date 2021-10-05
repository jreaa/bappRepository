<?php 
session_start();
include('../../vendor/autoload.php');
include('../CentroCosto/CentroCosto.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;



$id = $_GET['id'];

try{
    
    $centroCosto = new CentroCosto;
    $centroCosto->deleteCc($id);
    
    $_SESSION['c'] = "Usted ha eliminado un centro de costo";
    header("Location: ../../../centro_costo.php");
    

}catch(PDOException $e){
	echo $e;
}
	
