<?php 
session_start();
include('../../vendor/autoload.php');
include('../Examen/Examen.php');
include('../Upload/Upload.php');

use Illuminate\Database\Capsule\Manager as DB;


if(isset($_POST['btn'])){
	$titulo = strtolower($_POST['title']);
	$description = strtolower($_POST['description']);
	$fecha_inicio = $_POST['date'];
	$fecha_cierre = $_POST['date_end'];
	
	//documentos
	
    if(!empty($_FILES['archivo']['name'])){
        $namefile = $_FILES['archivo']['name'];
        $tmp_name = $_FILES['archivo']['tmp_name'];

    }else{
        $namefile = "";
    }
    
    
	try{
	    $examen = new Examen;
	    $examen->addExamen($titulo,$description,$fecha_inicio,$fecha_cierre,$namefile);
	    
	    //Importando img al servidor y base de datos
        $upload = new Upload;
        $upload->addImg($namefile,$tmp_name,"privileges",$id);
        
	    $_SESSION['e'] = "Usted ha agreado un nuevo examen satisfactoriamente";
        header("Location: ../../../addExamen.php");
	    

	}catch(PDOException $e){
		echo $e;
	}
	

}else{
    header("Location: ../../../privileges.php");
}