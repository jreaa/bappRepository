<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
include('../Comunicados/Comunicados.php');
include('../Upload/Upload.php');

use Illuminate\Database\Capsule\Manager as DB;


if(isset($_FILES['archivo'])){
	$name = $_FILES['archivo']['name'];
	$tmp_name = $_FILES['archivo']['tmp_name'];

	$upload = new Upload;
	$upload->addFileAchs($name,$tmp_name,$periodo="",$vigencia="");
}

$asunto = $_POST['asunto'];
$mensaje = $_POST['mensaje'];
$postulantes = $_POST['postulanteArray'];

if($postulantes == "todos"){
	$pos = json_decode(json_encode(DB::table('postulante')->where('disponible', '=', "Trabajando")->get()),True);
	foreach ($pos as $row) {
		$comunicados = new Comunicados;
		$comunicados->addComunicado($row['id'], $mensaje, $asunto);
	}
}else{

	$p = explode(',',$postulantes);

	$ids = [];

	for ($i=0; $i < sizeof($p) ; $i++) { 
		$pos = json_decode(json_encode(DB::table('postulante')->where('name', '=', $p[$i])->get()),True);
		foreach( $pos as $row){
			$id = $row['id'];
		}
		$comunicados = new Comunicados;
		$comunicados->addComunicado($id, $mensaje, $asunto);
	}

}

header('Location: ../../comunicados.php');