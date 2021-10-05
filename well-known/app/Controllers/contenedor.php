<?php 
include('../../vendor/autoload.php');
include('../Contenedor/Contenedor.php');
include('../Upload/Upload.php');
session_start();

$name = $_POST['name'];
$t_contrato = $_POST['t_contrato'];
$fecha = $_POST['fcha'];
$file = $_FILES['archivo']['name'];
$tmp_name = $_FILES['archivo']['tmp_name'];

try{
	$permiso = new Contrato;
	$permiso->addContrato($name,$t_contrato,$fecha, $file);

	$upload = new Upload;
	$upload->addFileAchs($file,$tmp_name,$periodo='0000-0-0',$vigencia='0000-0-0');
	
    $_SESSION['c'] = "Usted ha agreado un nuevo contrato satisfactoriamente";

}catch(PDOException $e){
	echo $e;
}
header('Location: ../../contratos.php');

