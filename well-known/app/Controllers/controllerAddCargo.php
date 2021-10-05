<?php 
session_start();
include('../../vendor/autoload.php');
include('../Cargos/Cargo.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

if(isset($_POST['btn'])){
	$ncargo = strtolower($_POST['ncargo']);
	$examen = strtolower($_POST['examen_adicional']);
	$id_examen = strtolower($_POST['id_examen']);
	
	if($_POST['docs']){
	    $documentaria = $_POST['docs'];
	    echo 'true';
	}else{
	    $documentaria = null;
	    echo 'false';
	}
	
	
	if ($examen == '1') {
		$examen = True;
		try{
		    DB::table('examen_extra')->insert([
    			'id_examen' => $id_examen,
    			'cargo_examen' => $ncargo
    		]);
		}catch(PDOException $e){
		    
		}

	}else if ($examen == '0') {
		$examen = False;
	}
	
    
	try{
	    
	    $cargo = new Cargo;
	    $cargo->addCargo($ncargo,$examen, $documentaria);
	    $_SESSION['c'] = "Usted ha agreado un nuevo cargo satisfactoriamente";
        header("Location: ../../../addCargos.php");
	    

	}catch(PDOException $e){
		echo $e;
	}
	

}else{
    header("Location: ../../../privileges.php");
}