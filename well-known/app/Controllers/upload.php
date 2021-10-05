<?php 
include('../Upload/Upload.php');


if (isset($_POST['btn'])) {
	$name = $_FILES['archivo']['name'];
	$tmp_name = $_FILES['archivo']['tmp_name'];
	$periodo = $_POST['periodo'];
	$vigencia = $_POST['vigencia'];
}else{
	echo "Somenthing is wrong";
}


$upload = new Upload;
$upload->addFile($name,$tmp_name,$periodo,$vigencia);

if ($upload) {
	header('../../mutualidad.php');
}else{
	echo 'Somenthing wrong';
}

