<?php 
include('../Upload/Upload.php');
include('../Convenio/Convenio.php');


$name = $_POST['name'];
$nfantasia = $_POST['nfantasia'];
$rubro = $_POST['rubro'];
$rut = $_POST['rut'];
$activity = $_POST['activity'];
$nconvenio = $_POST['nconvenio'];
$archivo_name = $_FILES['archivo']['name'];
$tmp_name = $_FILES['archivo']['tmp_name'];
$t_convenio = $_POST['t_convenio'];
$about = $_POST['about'];

$upload = new Upload;
$upload->addFileAchs($archivo_name,$tmp_name,$date= date("Y-m-d"),$date2=date("Y-m-d"));

$convenio = new Convenio;
$convenio->addConvenio($name, $nfantasia,$rubro,$rut,$activity,$nconvenio,$t_convenio,$about,$archivo_name);

header('Location: ../../convenios.php');