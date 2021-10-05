<?php
include('../../vendor/autoload.php');
include('../Database/Database.php');

include('../Postulante/Postulante.php');
include('../Upload/Upload.php');

use Illuminate\Database\Capsule\Manager as DB;
session_start();




$id = $_POST['id'];
$name = $_POST['name'];
$lastname = $_POST['lastname'];
$rut = $_POST['rut'];
$genere = $_POST['genere'];

$nivel_educacion = $_POST['nivel_educacion'];

if($genere == '0'){
	$p =json_decode(json_encode(DB::table('postulante')->where('id','=',$id)->get()),True);
	foreach ($p as $r) {
		$genere = $r['genere'];
	}
}


if(empty($_FILES['photo']['name'])){
	$p =json_decode(json_encode(DB::table('postulante')->where('id','=',$id)->get()),True);
	foreach ($p as $r) {
		$file = $r['img'];
	}
}else{
	$file = $_FILES['photo']['name'];
	$file_tmp = $_FILES['photo']['tmp_name'];
	$u = new Upload;
	$u->updateFilePostul($file,$file_tmp,$id);
}

$address = $_POST['address'];
$cpostular = $_POST['cargo_postular'];
$date = $_POST['date'];
$phone = $_POST['phone'];
$email = $_POST['email'];

try{
    $postulante = new Postulante;
    $postulante->updatePostulante($id,$name,$lastname,$rut,$genere,$address,$cpostular,$date,$phone,$email,$file,$nivel_educacion);
    $_SESSION['u'] = "Usted ha agreado editado un usuario satisfactoriamente";
    header('Location: ../../editarPostulante.php?id='.$id);
}catch(PDOException $e){
    echo $e;
}



