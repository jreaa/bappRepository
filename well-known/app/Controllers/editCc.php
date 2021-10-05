<?php 
session_start();
include('../../vendor/autoload.php');
include('../CentroCosto/CentroCosto.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

if(isset($_POST['btn'])){
	$cc = $_POST['cc'];
	$id_postulante = $_POST['id_postulante'];
	$status = $_POST['status'];
	$id = $_POST['id'];
	$fechainicio = $_POST['fechainicio'];
	$fechafinal = empty($_POST['fechafinal']) ? null : $_POST['fechafinal'];

	

	try{
	    if($fechainicio == ''){
	         DB::table("postulante")->where("id","=",$id_postulante)->update([
    	        "disponible" => $status,
    	        "fecha_final"  => $fechafinal
    	    ]);
	    }else{
	          DB::table("postulante")->where("id","=",$id_postulante)->update([
    	        "disponible" => $status,
    	        "fecha_inicio" => $fechainicio,
    	        "fecha_final"  => $fechafinal
    	    ]);
	    }
	  
	    
	    
	     DB::table("cc_vinculacion")->where("id","=",$id)->update([
	        "id_cc" => $cc
	    ]);
	    
	    
	    $_SESSION['c'] = "Usted ha editado una clasificacion";
        header("Location: ../../../clasificacion.php");
	    

	}catch(PDOException $e){
		echo $e;
	}
	

}else{
    header("Location: ../../../clasificacion.php");
}