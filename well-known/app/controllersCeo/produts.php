<?php 
require_once('../Producto/Producto.php');
require_once('../Asigna/Asigna.php');

$codigo = $_POST['codigo'];
$name = $_POST['name'];
$description = $_POST['description'];

$price = $_POST['price'];
$stock = $_POST['stock'];

$place = $_POST['place'];

try{
	$producto = new Producto;
	$producto->addPoducto($name, $codigo, $description, $price, $stock);
	if($producto){
		$asigna = new Asigna;
		$asigna->addAsigna($codigo,$place,$stock);

		header('Location: ../../product.php');

	}
}catch(PDOException $e){
	echo "No se ha podido hacer el registro, error de PDO";
}

