<?php 
include('../Upload/Upload.php');
include('../VincularPersonal/VincularPersonal.php');


$postulante = $_POST['postulante'];
$trato = $_POST['trato'];
$hora = $_POST['hora'];
$archivo_name = $_FILES['archivo']['name'];
$tmp_name = $_FILES['archivo']['tmp_name'];
$fecha1 = $_POST['fecha_inicio'];
$fecha2 = $_POST['fecha_cierre'];


$upload = new Upload;
$upload->addFileAchs($archivo_name,$tmp_name,$date= date("Y-m-d"),$date2=date("Y-m-d"));

$vincularPersonal = new VincularPersonal;
$vincularPersonal->addVP($postulante, $trato,$hora,$archivo_name,$fecha1,$fecha2);

header('Location: ../../vincular_personal.php');