<?php 

include('../../vendor/autoload.php');
include('../Database/Database.php');
include('../Upload/Upload.php');
include('../Seguro/Seguro.php');

session_start();
use Illuminate\Database\Capsule\Manager as DB;

$date = $_POST['date'];
$date_end = $_POST['date_end'];
$id = $_POST['postulante'];
$name_file = $_FILES['archivo']['name'];
$tmp_file = $_FILES['archivo']['tmp_name'];

try{

	$seguro = new Seguro;
	$seguro->addSeguro($date,$date_end,$id,$name_file);
	 $_SESSION['s'] = "Usted ha agregado un seguro satisfactoriamente";

	$upload = new Upload;
	$upload->addFile($name_file,$tmp_file,$date,$date_end);
}catch(PDOException $e){
	echo $e;
}
header('Location: ../../seguros.php');