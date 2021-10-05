<?php
include('../../vendor/autoload.php');
include('../Database/Database.php');
include('../Desvincular/Desvincular.php');
include('../Upload/Upload.php');


use Illuminate\Database\Capsule\Manager as DB;

if(!isset($_POST['id'])){
	$postulante = $_POST['postulante'];
	$fecha = $_POST['fecha'];
	$motivo = $_POST['motivo'];

	$desvincular = new Desvincular;
	$desvincular->addDesvinculacion($postulante,$fecha,$motivo);

	$desvincular = json_decode(json_encode(DB::table('desvincular')->get()), True);
	foreach ($desvincular as $row) {
		$id = $row['id'];
	}

	header('Location: ../../personal_inactivo.php?id'.$id);

}else{
	if(!isset($_POST['f'])){
		$name = $_FILES['archivo']['name'];
		$tmp_name = $_FILES['archivo']['tmp_name'];
		$id = $_POST['id'];

		$desvincular = new Desvincular;
		$desvincular->finiquitoDesvinculacion($name,$id);

		$upload = new Upload;
		$upload->addFileAchs($name,$tmp_name,$periodo='0000-00-00',$vigencia='0000-00-00');

		header('Location: ../../personal_inactivo.php?id='.$id);
		echo 'no notario';
	}else{
		$name = $_FILES['archivo']['name'];
		$tmp_name = $_FILES['archivo']['tmp_name'];
		$id = $_POST['id'];

		$desvincular = json_decode(json_encode(DB::table('desvincular')->where('id', '=', $id)->get()), True);
		foreach ($desvincular as $row) {
			$id_postulante = $row['id_postulante'];
		}

		$desvincular = new Desvincular;
		$desvincular->finiquitoUpdateDesvinculacion($name,$id,$id_postulante);

		$upload = new Upload;
		$upload->addFileAchs($name,$tmp_name,$periodo='0000-00-00',$vigencia='0000-00-00');

		header('Location: ../../personal_inactivo_proceso.php');
	}

}

