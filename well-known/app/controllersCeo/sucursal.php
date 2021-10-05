<?php 
require_once('../Sucursal/Sucursal.php');

$name = $_POST['name'];
$cod = $_POST['cod'];


try{
	$sucursal = new Sucursal;
	$sucursal->addSucural($name, $cod);
}catch(PDOException $e){
	echo $e;
}

header('Location: ../../index.php');

