<?php 
session_start();
include('../../vendor/autoload.php');
include('../Upload/Upload.php');


use Illuminate\Database\Capsule\Manager as DB;



if(isset($_POST['btn'])){
    

	$tmp_name = $_FILES["archivo2"]['tmp_name'];
    $archivo_name = $_FILES["archivo2"]['name'] ;
    
    $fecha_vencimiento_licencia = !empty($_POST['fecha_vencimiento_licencia']) ? $_POST['fecha_vencimiento_licencia'] : '0000-00-00';
    $fecha_vencimiento_cedula = !empty($_POST['fecha_vencimiento_cedula']) ? $_POST['fecha_vencimiento_cedula'] : '0000-00-00';


	try{
	    if(!empty($archivo_name)){
       	    DB::table('documentaria')->where('id', $_POST['id_documentaria'])->update([
    	       $_POST['nombre_position'] =>  $archivo_name,
    	       'licencia_v' => $fecha_vencimiento_licencia,
    	       'cedula_v' => $fecha_vencimiento_cedula
    	       
    	   ]);
    
    	    $upload = new Upload;
            $upload->updateFilePostul($archivo_name,$tmp_name);

	    }else{
	       DB::table('documentaria')->where('id', $_POST['id_documentaria'])->update([
    	       'licencia_v' => $fecha_vencimiento_licencia,
    	       'cedula_v' => $fecha_vencimiento_cedula
    	   ]);
	    }

	    
	    $_SESSION['c'] = "Usted ha agregado un nuevo documento satisfactoriamente";
        header("Location: ../../../documentaria.php?id=".$_POST['id_postulante']);
	    

	}catch(PDOException $e){
		echo $e;
	}
	

}else{
    header("Location: ../../../documentaria.php?id=".$_POST['id_postulante']);
}

