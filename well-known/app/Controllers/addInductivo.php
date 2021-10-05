<?php 
session_start();
include('../../vendor/autoload.php');
include('../Inductivo/Inductivo.php');
include('../Database/Database.php');
include('../Upload/Upload.php');
include('../Mail/Mail.php');

use Illuminate\Database\Capsule\Manager as DB;


var_dump($question);

if(isset($_POST['btn'])){
    

	$tmp_name = (!empty($_FILES["archivo"]['tmp_name'])) ? $tmp_name = $_FILES["archivo"]['tmp_name'] : $tmp_name = null;
	$archivo_name = (!empty($_FILES["archivo"]['name'])) ? $name = $_FILES["archivo"]['name'] : $name = null;
	$fecha_inductivo = $_POST['fecha_inductivo'];
	$hora_inductivo = $_POST['hora_inductivo'];
	$id_postulante = $_POST['id_postulante'];
	$tags = $_POST['tags'];
	
	$postulante = DB::table('postulante')->where('id', $id_postulante)->get();
    $question = explode(',',ltrim(strtr(strtr(trim($tags, '[]'), '{', ' '), '}', ' '), ' '));
    //var_dump($question);
    
    for($i=0; $i < sizeof($question); $i++){
       $question[$i] = strtr(trim(trim($question[$i], '"value" value "'),':"'), '"', ' ');
    }
	try{
	    
	    $inductivo = new Inductivo;
	    $inductivo->create($id_postulante, $fecha_inductivo, $hora_inductivo,json_encode($question),$archivo_name);
	    
	    $upload = new Upload;
        $upload->updateFilePostul($archivo_name,$tmp_name);
        
        $message = '
            Se ha agregado un inductivo a su cuenta, los datos son los siguientes <br>
            <span style="font-weight: bold;">Fecha Inductivo :  '.$fecha_inductivo.'</span> <br>
            <span style="font-weight: bold;">Hora Inductivo :  '.$hora_inductivo.'</span> <br>
            Toda esta informacion podra ser observada dentro de ceoApp.
        ';
        
        $mail = new Email;
        $mail->create($message,'NUEVO INDUCTIVO AGENDADO', $name,$postulante[0]->email);
	    
	    
	    $_SESSION['c'] = "Usted ha agreado una nueva induccion";
        header("Location: ../../../inductivo.php");
	    

	}catch(PDOException $e){
		echo $e;
	}
	

}else{
    header("Location: ../../../inductivo.php");
}