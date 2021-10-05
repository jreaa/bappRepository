<?php
include('../Upload/Upload.php');
include('../Accidente/Accidente.php');

$name = $_FILES['archivo']['name'];
$tmp_name = $_FILES['archivo']['tmp_name'];
$f_evento = $_POST['f_evento'];
$f_resultado = $_POST['f_resultado'];
$resultado = $_POST['resultado'];


$upload = new Upload;
$upload->addFileAchs($name,$tmp_name,$f_evento,$f_resultado);

$accidente = new Accidente;
$accidente->addAccidente($name,$f_evento,$f_resultado,$resultado);

header('Location: ../../accidente.php');