<?php
include('../../vendor/autoload.php');
include('../Database/Database.php');
include('../Msiniestro/Msiniestro.php');
use Illuminate\Database\Capsule\Manager as DB;
session_start();

$date = $_POST['date'];
$patente = $_POST['patente'];
$mVehiculo = $_POST['mVehiculo'];
$nreserva = $_POST['nreserva'];
$taller = $_POST['taller'];
$today = $_POST['today'];
$hora = $_POST['hora'];
$direccion = $_POST['direccion'];
$servicio = $_POST['servicio'];
$observaciones = $_POST['observaciones'];
$fentrega = $_POST['fentrega'];
$resultado = $_POST['resultado'];
$postulante = $_POST['postulante'];

$msiniestro = new Msiniestro;
$msiniestro->addMsiniestro($date,$patente,$mVehiculo,$nreserva,$taller,$today,$hora,$direccion,$servicio,$observaciones,$fentrega,$resultado,$postulante);
$_SESSION['m'] = "Usted ha agregado una mantencion satisfactoriamente";


if ($msiniestro) {
	header('Location: ../../mantencion_siniestro.php');
}