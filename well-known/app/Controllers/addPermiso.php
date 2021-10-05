<?php 
include('../../vendor/autoload.php');
include('../Permiso/Permiso.php');
include('../Database/Database.php');
session_start();

use Illuminate\Database\Capsule\Manager as DB;

$postulante = json_decode(json_encode(DB::table('postulante')->where('id', '=',$_POST['postulante'])->get()),True);
foreach ($postulante as $row) {
	$rut = $row['rut'];
}
$id = $_POST['postulante'];
$departamento =  $_POST['departamento'];
$t_permiso =  $_POST['t_permiso'];
$status =  $_POST['status'];
$firma =  $_POST['firma'];
$fecha =  $_POST['fecha'];
$comentarios = $_POST['comentario'];

$permiso = new Permiso;
$permiso->addPermiso($id,$rut,$departamento,$t_permiso,$status,$firma,$fecha,$comentarios);
$_SESSION['p'] = "Usted ha agreado un nuevo permiso satisfactoriamente";

header('Location: ../../permisos.php');