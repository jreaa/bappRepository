<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
session_start();
$url = $_SESSION['url'];
use Illuminate\Database\Capsule\Manager as DB;

if(!isset($_POST['btn'])){
	echo 'Acceso denegado!!';
}
$postulante=DB::table('postulante')->where('rut', '=', $_POST['rut'])->get();
$array = json_decode(json_encode($postulante), True);
if($array[0] != ''){
	foreach($array as $row){
		$cargo_postular = $row['cargo_postular'];
		$name = $row['name'];
		$rut = $row['rut'];
		$lastname = $row['lastname'];
	}
	$_SESSION['postulante'] = $name;
	$_SESSION['cargo_postular'] = $cargo_postular;
	$_SESSION['rut'] = $rut;
	$_SESSION['lastname'] = $lastname;
	header('Location: '.$url);
}